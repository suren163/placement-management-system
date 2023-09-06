<?php
session_start();
include('./database/db.php');
include('./alert.php');
if (!isset($_SESSION['id'])) {
    header('location:login.php');
}


$s_id = $_SESSION['id'];
$stud = mysqli_query($con, "SELECT * FROM studentdetail where id= '$s_id'");
$fetch_stud = mysqli_fetch_array($stud);

$stud = mysqli_query($con, "SELECT * FROM users where id= '$s_id'");
$fet_stud = mysqli_fetch_array($stud);

$select = mysqli_query($con, 'SELECT * FROM newplacement');
if (isset($_GET['log']) && $_GET['log'] === 'yes') {
    unset($_SESSION['id']);
    header('location:login.php');
} elseif (isset($_GET['log']) && $_GET['log'] === 'no') {
}

$id = $_GET['id'];
$select = "SELECT * FROM newplacement WHERE id='$id'";
$reg = mysqli_query($con, $select);
$fetch = mysqli_fetch_array($reg);


$idd = $_SESSION['id'];
// Fetch user's data from the studentdetail table
$selectUserQuery = "SELECT * FROM studentdetail WHERE id='$idd'";
$userResult = mysqli_query($con, $selectUserQuery);
$userData = mysqli_fetch_assoc($userResult);
if (isset($_POST['submit'])) {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        $fileTmpPath = $_FILES['resume']['tmp_name'];
        $fileName = $_FILES['resume']['name'];
        $fileSize = $_FILES['resume']['size'];
        $fileType = $_FILES['resume']['type'];
        if ($fileSize / 1024 <= 500) {
            $uploadDir = 'resume_uploads/'; // Directory to save uploaded photos
            $uploadPath = $uploadDir . $fileName;
            // Move the uploaded file to the desired directory
            if (move_uploaded_file($fileTmpPath, $uploadPath)) {
                // Update the profile photo path in the database
                $updatePhotoQuery = "INSERT INTO pdf (s_id,c_id,resume) VALUES ($idd,$id,'$uploadPath')";
                mysqli_query($con, $updatePhotoQuery);
                header('location:applied.php');
            }
        } else {
            echo "file size must be less than 500";
        }
    }
}
?>

<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data='data()' lang='en'>

<head>
    <meta charset='UTF-8' />
    <meta name='viewport' content='width=device-width, initial-scale=1.0' />
    <title>Dashboard</title>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9' crossorigin='anonymous'>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js' integrity='sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm' crossorigin='anonymous'>
    </script>

    <link href='https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap' rel='stylesheet' />
    <link rel='stylesheet' href='../assets/css/tailwind.output.css' />
    <script src='https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js' defer></script>
    <script src='../assets/js/init-alpine.js'></script>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css' />
    <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js' defer></script>
    <script src='../assets/js/charts-lines.js' defer></script>
    <script src='../assets/js/charts-pie.js' defer></script>
    <style>
        .cont {
            width: 80%;
            padding-left: 15%;
        }
    </style>
</head>

<body>
    <div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen}">
        <!-- Desktop sidebar -->
        <aside class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0">
            <div class="py-4 text-gray-500 dark:text-gray-400">
                <div class="py-2 text-gray-500 dark:text-gray-400 flex items-center">
                    <a href="https://sjctni.edu/" class="mr-2">
                        <img src="../admin/img/sjc.png" alt="College Logo" width="75" height="75" class="rounded-full" style="text-align: center;">
                    </a>
                    <span class="ml-3 text-lg font-bold text-gray-800 dark:text-gray-200">SJC Placement Management</span>
                </div>
                <ul class="mt-6">
                    <li class="relative px-10 py-3">
                        <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" href="user_home.php">
                            <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                                <path d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6">
                                </path>
                            </svg>
                            <span class="ml-4">Dashboard</span>
                        </a>
                    </li>
                </ul>
                <ul>
                    <li class='relative px-6 py-3'>
                        <span class='absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg' aria-hidden='true'></span>
                        <a class='inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100' href='user_home.php'>
                            <svg class='w-5 h-5' aria-hidden='true' fill='none' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' viewBox='0 0 24 24' stroke='currentColor'>
                                <path d='M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01'>
                                </path>
                            </svg>
                            <span class='ml-4'>Application Submission</span>
                        </a>
                    </li>
                </ul>
                <ul>
                    <li class='relative px-6 py-3'>
                        <a class='inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200' href='?log=yes' onclick="return confirm('Do you want to logout?')">
                            <svg class='w-4 h-4 mr-3' aria-hidden='true' fill='none' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' viewBox='0 0 24 24' stroke='currentColor'>
                                <path d='M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1'>
                                </path>
                            </svg>
                            <span class='ml-4'>Logout</span>
                        </a>
                    </li>
                </ul>
        </aside>
        <!-- Mobile sidebar -->
        <!-- Backdrop -->
        <div x-show="isSideMenuOpen" x-transition:enter="transition ease-in-out duration-150" x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100" x-transition:leave="transition ease-in-out duration-150" x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0" class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"></div>
        <aside class="fixed inset-y-0 z-20 flex-shrink-0 w-64 mt-16 overflow-y-auto bg-white dark:bg-gray-800 md:hidden" x-show="isSideMenuOpen" x-transition:enter="transition ease-in-out duration-150" x-transition:enter-start="opacity-0 transform -translate-x-20" x-transition:enter-end="opacity-100" x-transition:leave="transition ease-in-out duration-150" x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0 transform -translate-x-20" @click.away="closeSideMenu" @keydown.escape="closeSideMenu">
            <div class="py-4 text-gray-500 dark:text-gray-400">
                <div class="py-2 text-gray-500 dark:text-gray-400 flex items-center">
                    <a href="https://sjctni.edu/" class="mr-2">
                        <img src="../admin/img/sjc.png" alt="College Logo" width="75" height="75" class="rounded-full" style="text-align: center;">
                    </a>
                    <span class="ml-3 text-lg font-bold text-gray-800 dark:text-gray-200">SJC Placement Management</span>
                </div>
                <ul class="mt-6">
                    <li class="relative px-10 py-3">
                        <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" href="user_home.php">
                            <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                                <path d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6">
                                </path>
                            </svg>
                            <span class="ml-4">Dashboard</span>
                        </a>
                    </li>
                </ul>
                <ul>
                    <ul>
                        <li class='relative px-6 py-3'>
                            <span class='absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg' aria-hidden='true'></span>
                            <a class='inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100' href='user_home.php'>
                                <svg class='w-5 h-5' aria-hidden='true' fill='none' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' viewBox='0 0 24 24' stroke='currentColor'>
                                    <path d='M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01'>
                                    </path>
                                </svg>
                                <span class='ml-4'>Application Submission</span>
                            </a>
                        </li>
                    </ul>
                    <ul>
                        <li class='relative px-6 py-3'>
                            <a class='inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200' href='?log=yes' onclick="return confirm('Do you want to logout?')">
                                <svg class='w-4 h-4 mr-3' aria-hidden='true' fill='none' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' viewBox='0 0 24 24' stroke='currentColor'>
                                    <path d='M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1'>
                                    </path>
                                </svg>
                                <span class='ml-4'>Logout</span>
                            </a>
                        </li>
                    </ul>
        </aside>

        <div class='flex flex-col flex-1 w-full'>
            <header class='z-10 py-4 bg-white shadow-md dark:bg-gray-800'>
                <div class='container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300'>
                    <!-- Mobile hamburger -->
                    <button class='p-1 mr-5 -ml-1 rounded-md md:hidden focus:outline-none focus:shadow-outline-purple' @click='toggleSideMenu' aria-label='Menu'>
                        <svg class='w-6 h-6' aria-hidden='true' fill='currentColor' viewBox='0 0 20 20'>
                            <path fill-rule='evenodd' d='M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z' clip-rule='evenodd'></path>
                        </svg>
                    </button>
                    <!-- Search input -->
                    <div class='flex justify-center flex-1 lg:mr-32'>
                        <div class='relative w-full max-w-xl mr-6 focus-within:text-purple-500'>
                            <div class='absolute inset-y-0 flex items-center pl-2'>
                                <svg class='w-4 h-4' aria-hidden='true' fill='currentColor' viewBox='0 0 20 20'>
                                    <path fill-rule='evenodd' d='M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z' clip-rule='evenodd'></path>
                                </svg>
                            </div>
                            <input class='w-full pl-8 pr-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input' type='text' placeholder='Search for Jobs' aria-label='Search' />
                        </div>
                    </div>
                    <ul class='flex items-center flex-shrink-0 space-x-6'>

                        <!-- Profile menu -->
                        <li class='relative'>
                            <button class='align-middle rounded-full focus:shadow-outline-purple focus:outline-none' @click='toggleProfileMenu' @keydown.escape='closeProfileMenu' aria-label='Account' aria-haspopup='true'>
                                <img class="object-cover w-8 h-8 rounded-full" src="<?php echo isset($userData['profile_photo']) ? $userData['profile_photo'] : '../image/user.png'; ?>" alt="" aria-hidden="true" />
                            </button>
                            <?php echo $fet_stud['dno'];
                            ?>
                            <template x-if='isProfileMenuOpen'>
                                <ul x-transition:leave='transition ease-in duration-150' x-transition:leave-start='opacity-100' x-transition:leave-end='opacity-0' @click.away='closeProfileMenu' @keydown.escape='closeProfileMenu' class='absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:border-gray-700 dark:text-gray-300 dark:bg-gray-700' aria-label='submenu'>
                                    <li class='flex'>
                                        <a class='inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200' href='profile.php'>
                                            <svg class='w-4 h-4 mr-3' aria-hidden='true' fill='none' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' viewBox='0 0 24 24' stroke='currentColor'>
                                                <path d='M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z'>
                                                </path>
                                            </svg>
                                            <span>Profile</span>
                                        </a>
                                    </li>

                                    <li class='flex'>
                                        <a class='inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200' href='?log=yes' onclick="return confirm('Do you want to logout?')">
                                            <svg class='w-4 h-4 mr-3' aria-hidden='true' fill='none' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' viewBox='0 0 24 24' stroke='currentColor'>
                                                <path d='M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1'>
                                                </path>
                                            </svg>
                                            <span>Log out</span>
                                        </a>
                                    </li>
                                </ul>
                            </template>
                        </li>
                    </ul>
                </div>
            </header>
            <main class='h-full overflow-y-auto'>

                <br>
                <div class='card' style='padding-left: 20px;margin:0 20px 0 20px ;'>
                    <div class='card-body'>
                        <h5 class='card-title'>Apply for</h5>
                        <div class='card-text'>
                            <p><strong>Company:</strong>
                                <?php echo $fetch['name'];
                                ?>
                            </p>
                            <p><strong>Job Title:</strong>
                                <?php echo $fetch['title'];
                                ?>
                            </p <p><strong>Location:</strong>
                            <?php echo $fetch['location'];
                            ?>
                            </p>
                            <!-- Display other data here -->
                        </div>
                    </div>
                </div>

                <div class='container d-flex justify-content-center align-items-center mt-5'>
                    <div class='col-md-8'>

                        <div class='p-4 bg-white text-dark rounded-lg shadow'>
                            <h2 class='mb-4 text-2xl font-semibold'>
                                Your Details
                            </h2>

                            <div class='mb-4'>
                                <h1 class='text-lg font-semibold'>
                                    Name: <?php echo $fet_stud['name']; ?>
                                </h1>
                                <p class='text-lg font-semibold'>
                                    D no: <?php echo $fet_stud['dno']; ?>
                                </p>
                                <p class='text-lg font-semibold'>
                                    Department: <?php echo isset($userData['major']) ? $userData['major'] : ''; ?>
                                </p>
                                <p class='text-lg font-semibold'>
                                    Mobile Number: <?php echo isset($userData['phone']) ? $userData['phone'] : ''; ?>
                                </p>
                                <p class='text-lg font-semibold'>
                                    Email: <?php echo isset($userData['email']) ? $userData['email'] : ''; ?>
                                </p>
                            </div>
                            <hr class='my-4'>
                            <form method="post" enctype="multipart/form-data">
                                <div class='mb-3'>
                                    <label for='resume'>Upload Resume:</label>
                                    <input class='form-control' type='file' name='resume' id='resume' accept="application/pdf">
                                </div>
                                <button class='btn btn-primary' type="submit" name="submit">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>



        </div>
    </div>
    </div>
    </div>
    </main>
    </div>
    </div>
</body>
<?php echo $fetch_stud['degree'];
?>

</html>