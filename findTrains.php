<!DOCTYPE html>
<html lang="en">
<?php
require_once 'head.php';
?>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<!-- Navigation-->
<?php
require_once 'sidebar.php';
?>
<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Example DataTables Card-->
        <div class="card mb-3" style="padding: 20px">
            <form onsubmit="return findAvailableTickets()">
                <div class="row">
                    <div class="form-group col-4">
                        <label for="exampleInputEmail1">Start Station</label>
                        <select name="" id=""></select>
                        <input class="form-control" id="exampleInputEmail1" type="date" aria-describedby="emailHelp"
                               placeholder="Enter email" required>
                    </div>
                </div>
                <input type="submit" class="btn btn-primary btn-block col-4" value="Search" />
            </form>
        </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
        <div class="container">
            <div class="text-center">
                <small>Copyright © Your Website 2018</small>
            </div>
        </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <?php
    require_once 'footer.php';
    ?>
</div>
</body>
<script>
    function findAvailableTickets() {
        return false;
    }
</script>
</html>
