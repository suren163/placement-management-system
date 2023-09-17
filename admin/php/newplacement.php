<?php
include("../database/db.php");
session_start();

if (isset($_POST['add'])) {
    $name = $_POST['name'];
    $title = $_POST['title'];
    $qualification = $_POST['qualification'];
    $location = $_POST['location'];
    $contact = $_POST['contact'];
    $details = $_POST['details'];
    $vacancy = $_POST['vacancy'];
    $lastdate = $_POST['lastdate'];

    // Handle logo upload
    if (isset($_FILES['logo']) && $_FILES['logo']['error'] === UPLOAD_ERR_OK) {
        $fileTmpPath = $_FILES['logo']['tmp_name'];
        $fileName = $_FILES['logo']['name'];
        $fileSize = $_FILES['logo']['size'];
        $fileType = $_FILES['logo']['type'];

        $uploadDir = 'logo/'; // Directory to save uploaded logos
        $uploadPath = $uploadDir . $fileName;

        // Move the uploaded file to the desired directory
        if (move_uploaded_file($fileTmpPath, $uploadPath)) {
            // Logo uploaded successfully, now insert data into the database
            $s = "INSERT INTO newplacement(name,title, qualification,location,contact, details, vacancy,lastdate, logo) VALUES ('$name','$title','$qualification','$location','$contact','$details','$vacancy','$lastdate', '$uploadPath')";

            if (mysqli_query($con, $s)) {
                echo "<script>alert('Successfully Added'); window.location='../companydetails.php';</script>";
            } else {
                echo "<script>alert('Not added ');window.location='../newplacement.php';</script>";
            }
        } else {
            echo "<script>alert('Error uploading logo');</script>";
        }
    } else {
        echo "<script>alert('No logo uploaded');</script>";
    }
}
