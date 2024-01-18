<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Gestion_étudiant_Dashboard</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="styles.css" rel="stylesheet">
</head>

<body>
    <header>
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-secondary navbar-dark">
                    <a href="/TPTEST "class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-graduation-cap me-2"></i>StudySys<br> Dashboard</h3>
                    </a>
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown" style="margin-left: 10px;">
                            <a class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fas fa-user-graduate me-2"></i>Etudiants</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="/TPTEST/EtudiantListServlet" class="dropdown-item"><i class="fas fa-list"></i>&nbsp;Liste des étudiants</a>
                                <a href="register.jsp" class="dropdown-item"><i class="fas fa-plus me-1"></i>Ajouter étudiant</a>
                            </div>
                        </div>

                        <div class="nav-item dropdown" style="margin-top: 20px;margin-left: 10px;">
                            <a class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fas fa-book-open me-2"></i> Modules</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a  href="/TPTEST/ModuleListServlet" class="dropdown-item"><i class="fas fa-list"></i>&nbsp;Liste des modules </a>
                                <a href="moduleadd.jsp" class="dropdown-item"> <i class="fas fa-plus me-1"></i>Ajouter module </a>
                            </div>
                        </div>

                        <div class="nav-item dropdown" style="margin-top: 20px;margin-left: 10px;">
                            <a class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fas fa-chart-line me-2"></i>Notes</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="/TPTEST/NoteListServlet"  class="dropdown-item"><i class="fas fa-list"></i>&nbsp;Liste des notes </a>
                                <a href="addNote.jsp"  class="dropdown-item"> <i class="fas fa-plus me-1"></i>&nbsp;Ajouter note  </a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->

            <!-- Content Start -->
            <div class="content d-flex flex-column mt-5">
                <div class="text-center" >
                    <script>
                        // Obtenez l'URL actuelle du navigateur
                        var currentURL = window.location.href;

                        // Vérifiez si l'URL est égale à "http://localhost:8080/TPTEST"
                        if (currentURL === "http://localhost:8080/TPTEST/") {
                            // Affichez le texte et l'image si la condition est vraie
                            document.write('<h1 style="color: red;">Explorez notre application numérique StudySys</h1>');
                            document.write('<p style="color: gray; font-size: 25px;">pour simplifier la gestion des étudiants, des notes et des modules. Facilitez votre expérience académique avec une plateforme intuitive et efficace, conçue pour optimiser votre réussite éducative.</p>');
                            document.write('<img src="eleve.png" alt="Your Image" style="width: 1000px; height: 500px;">');
                        }
                    </script>
                </div>
            </div>
        </div>
        <!-- Content End -->
    </header>

    <div class="container">
        <main role="main" class="pb-3">
            <!-- Placeholder for @RenderBody() -->
        </main>
    </div>
<style>
.footer-container {
    margin-left: 252px; /* Ajustez la valeur selon vos besoins */
    width: 84%; /* Ajustez la valeur selon vos besoins */
    position: fixed;
    bottom: 0;
}
</style>
    <!-- Footer Start -->
<div class="footer-container bg-secondary rounded-top p-2">
        <div class="bg-secondary rounded-top p-2">
            <div class="row">
                <div class="col-12 col-sm-6 text-center text-sm-start">
                    &copy; <a href="">StudySys</a>, All Right Reserved.
                </div>
                <div class="col-12 col-sm-6 text-center text-sm-end" style="margin-left: 400px;">
                    Designed By <a href="https://github.com/FatimaEzzahraSeffari?tab=repositories">FatimaEzzahraSeffari</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top" ><i class="bi bi-arrow-up"></i></a>
</body>
</html>
