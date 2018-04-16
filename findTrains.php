<!DOCTYPE html>
<html lang="en">
<?php
require_once 'head.php';
require_once 'db.php';

if (isset($_REQUEST["findDestination"]) && $_REQUEST["findDestination"] == "yes") {
    $sql = "SELECT * FROM `station` WHERE `station_id` <> ".$_REQUEST["startStation"];
    $res = $conn->query($sql);
    while ($row = $res->fetch_assoc()) {
        $a .= '<option value="<?=$row["station_id"]?>"><?=$row["station_name"]?></option>';
    }
    exit;
}
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
            <form onsubmit="return findTrains()">
                <div class="row">
                    <div class="form-group col-4">
                        <label for="exampleInputEmail1">Start Station</label>
                        <select onchange="showEndStation()" class="form-control" name="startstation" id="startstation" required>
                            <option value="">Select Station</option>
                            <?php
                            $sql = "SELECT * FROM `station`";
                            $res = $conn->query($sql);
                            while ($row = $res->fetch_assoc()) {
                                ?>
                                <option class="form-control" value="<?= $row["station_id"] ?>"><?= $row["station_name"] ?></option>
                                <?php
                            }
                            ?>
                        </select>
                    </div>
                    <div class="col-4 form-group">
                        <label for="exampleInputEmail1">End Station</label>
                        <select class="form-control" name="endstation" id="endstation" required>
                            <option id="destinationdisabled" value="" disabled>Select Start Station</option>
                        </select>
                    </div>
                </div>
                <input type="submit" class="btn btn-primary btn-block col-4" value="Search"/>
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
    function findTrains() {
        return false;
    }

    function showEndStation() {
        var startStation = $('#startstation');
        $.post('findTrains.php', {findDestination: "yes", startStation: startStation.val()})
            .then(function (data) {
                $('#endstation');
            })
    }
</script>
</html>
