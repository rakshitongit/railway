<?php
require_once 'db.php';

if (isset($_REQUEST["findDestination"]) && $_REQUEST["findDestination"] == "yes") {
    $sql = "SELECT * FROM `station` WHERE `station_id` <> " . $_REQUEST["startStation"];
    $res = $conn->query($sql);
    while ($row = $res->fetch_assoc()) {
        $a .= '<option value="' . $row["station_id"] . '">' . $row["station_name"] . '</option>';
    }
    echo $a;
    exit;
}

function getStationName($id, $conn)
{
    $sql = "SELECT * FROM `station` WHERE `station_id` = " . $id;
    $res = $conn->query($sql);
    return $res->fetch_assoc()["station_name"];
}

if (isset($_REQUEST["findTrains"]) && $_REQUEST["findTrains"] == "yes") {
    $sql = "SELECT * FROM `train` WHERE `start_station_id` = " . $_REQUEST["startStation"] . " AND `end_station_id` = " . $_REQUEST["endStation"];
    $res = $conn->query($sql); ?>
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
        <tr>
            <th>Train Name</th>
            <th>Train Type</th>
            <th>Start Station</th>
            <th>End Station</th>
            <th>Book</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th>Train Name</th>
            <th>Train Type</th>
            <th>Start Station</th>
            <th>End Station</th>
            <th>Book</th>
        </tr>
        </tfoot>
        <tbody>
        <?php
        while ($row = $res->fetch_assoc()) { ?>
            <tr>
                <td><?= $row["train_name"] ?></td>
                <td><?= $row["train_type"] ?></td>
                <td><?= getStationName($_REQUEST["startStation"], $conn) ?></td>
                <td><?= getStationName($_REQUEST["endStation"], $conn) ?></td>
                <td><button class="btn btn-success" onclick="location.href='bookTickets.php?userId=&trainId=<?=$row["train_id"]?>&'">Book</button></td>
            </tr>
            <?php
        }
        ?>
        </tbody>
    </table>
    <?php
    exit;
}

require_once 'head.php';
?>
<style>
    .hidden {
        display: none;
    }
</style>
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
                        <select onchange="showEndStation()" class="form-control" name="startstation" id="startstation"
                                required>
                            <option value="">Select Station</option>
                            <?php
                            $sql = "SELECT * FROM `station`";
                            $res = $conn->query($sql);
                            while ($row = $res->fetch_assoc()) {
                                ?>
                                <option class="form-control"
                                        value="<?= $row["station_id"] ?>"><?= $row["station_name"] ?></option>
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

        <div class="card mb-3 hidden" id="trainList" style="padding: 20px">
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
        let startStation = $('#startstation');
        let trainList = $('#trainList');
        trainList.removeClass('hidden');
        let endStation = $('#endstation');
        $.post('findTrains.php', {
            findTrains: "yes",
            startStation: startStation.val(),
            endStation: endStation.val()
        }).then(function (data) {
            console.log(data);
            trainList.append(data);
            $("#dataTable").DataTable()
        });
        return false;
    }

    function showEndStation() {
        let startStation = $('#startstation');
        $.post('findTrains.php', {findDestination: "yes", startStation: startStation.val()})
            .then(function (data) {
                console.log(data);
                $('#endstation').append(data);
            })
    }
</script>
</html>
