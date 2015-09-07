/**
 * Created by Administrator on 2015/8/27.
 */
var select_page = 1;
$(document).ready(function () {

    $.ajax({
        url: "index_GetJson.do",
        data: 'data',
        dataType: 'json',
        success: function (data) {
            var text = "";
            var sum = 0;
            $.each(data, function (i, value1) {
                sum = parseInt(value1.length / 10);
                if (value1.length % 10 != 0) sum++;
                $.each(value1, function (ii, value2) {
                    text += '<tr id="customer' + value2.Customerid + '">';
                    text += '<td><a onclick="showeditinfo(' + value2.Customerid + ',\'' + value2.FirstName + '\',\'' + value2.LastName + '\',\'' + value2.Address + '\',\'' + value2.Email + '\')" data-toggle="modal">编辑</a></td>';
                    text += '<td><a onclick=showdeletealert(' + (value2.Customerid) + ')>删除</a></td>';
                    text += "<td>" + value2.FirstName + "</td>";
                    text += "<td>" + value2.LastName + "</td>";
                    text += "<td>" + value2.Address + "</td>";
                    text += "<td>" + value2.Email + "</td>";
                    text += "<td>" + value2.Customerid + "</td>";
                    text += "<td>" + value2.LastUpdate + "</td>";
                    text += "</td>";
                    if (ii == 9) {
                        return false;
                    }
                });
            });
            $("#mytbody").append(text);
            addselect(sum);
        }
    });
})
function addselect(sum) {
    var selects = "";
    selects += "<select onchange='dopage()' id='myselect'>";
    for (var i = 1; i <= sum; i++) {
        selects += "<option value='" + i + "'>" + i + "</option><br>";
    }
    selects += "</select>页";
    $("#selectdiv").append(selects);
}
function dopage() {
    select_page = $("#myselect").val();
    $.ajax({
        url: "index_GetJson.do",
        data: 'data',
        dataType: 'json',
        success: function (data) {
            var text = "<tr style='border-bottom: 2px solid blue'>";
            text += "<td colspan='2'>操作</td>";
            text += "<th>First Name</th>";
            text += "<th>Last Name</th>";
            text += "<th>Address</th>";
            text += "<th>Email</th>";
            text += "<th>Customerid</th>";
            text += "<th>LastUpdate</th>";
            text += "</tr>";
            var sum = 0;
            var start = (select_page - 1) * 10;
            var end = select_page * 10;
            $.each(data, function (i, value1) {
                sum = parseInt(value1.length / 10);
                if (value1.length % 10 != 0) sum++;
                $.each(value1, function (ii, value2) {
                    if (ii >= start) {
                        text += '<tr id="customer' + value2.Customerid + '">';
                        text += '<td><a onclick="showeditinfo(' + value2.Customerid + ',\'' + value2.FirstName + '\',\'' + value2.LastName + '\',\'' + value2.Address + '\',\'' + value2.Email + '\')" data-toggle="modal">编辑</a></td>';
                        text += "<td><a onclick=showdeletealert(" + (value2.Customerid) + ")>删除</a></td>";
                        text += "<td>" + value2.FirstName + "</td>";
                        text += "<td>" + value2.LastName + "</td>";
                        text += "<td>" + value2.Address + "</td>";
                        text += "<td>" + value2.Email + "</td>";
                        text += "<td>" + value2.Customerid + "</td>";
                        text += "<td>" + value2.LastUpdate + "</td>";
                        text += "</td></tr>";
                        start++;
                    }
                    if (start == end) {
                        return false;
                    }
                });
            });
            $("#mytbody").empty();
            $("#mytbody").append(text);
        }
    });
}
function showeditinfo(id, fn, ln, add, em) {
    $("#Customerid").val(id);
    $("#FirstName").val(fn);
    $("#LastName").val(ln);
    getaddress(add);
    $("#Email").val(em);
    $("#mymodal").modal({backdrop: 'static'}, "show");
}

function showdeletealert(id) {
    if (confirm("删除Custom ID为" + id + "客户信息吗？")) {
        $.ajax({
            url: "index_delete.do",
            type: "post",
            data: "delete_id=" + id,
            async: true,
            success: function () {
                dopage();
            },
            error: function (data) {
                alert("删除失败！");
            }
        });
    }
}
function getaddress(add){
    var selects="";
    $.ajax({
        url: "index_GetAddressJson.do",
        data: 'data',
        dataType: 'json',
        success: function (data) {
            $.each(data, function (i, value1) {
                $.each(value1, function (ii, value2) {
                    if(add == value2.Address){
                        selects += "<option value='" + value2.Addressid + "' selected>" + value2.Address + "</option><br>";
                    }else
                        selects += "<option value='" + value2.Addressid + "'>" + value2.Address + "</option><br>";
                });
            });

            $("#Address").append(selects);
        }
    });
}
function edit() {
    //alert("customerid="+$("#Customerid").val()+"&firstname="+$("#FirstName").val()+"&lastname="+$("#LastName").val()+"&address="+$("#Address").val()+"&email="+$("#Email").val());
    $.ajax({
        url: "index_edit.do",
        type: "post",
        data: "customerid=" + $("#Customerid").val() + "&firstname=" + $("#FirstName").val() + "&lastname=" + $("#LastName").val() + "&address=" + $("#Address").val() + "&email=" + $("#Email").val(),
        async: true,
        success: function (data) {

            $("#mymodal").modal('hide');
            dopage();
        },
        error: function (data) {
            alert("编辑失败！");
        }
    });
}

function tofilmindex() {
    alert("后续FilmIndex.jsp尚未完成！")
}

function toindex() {
    location = "index.jsp";
}
