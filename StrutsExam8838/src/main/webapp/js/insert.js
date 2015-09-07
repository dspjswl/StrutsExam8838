$(document).ready(function (){
    var selects="";
    $.ajax({
        url: "index_GetAddressJson.do",
        data: 'data',
        dataType: 'json',
        success: function (data) {
            $.each(data, function (i, value1) {
                $.each(value1, function (ii, value2) {
                        selects += "<option value='" + value2.Addressid + "'>" + value2.Address + "</option><br>";
                });
            });
            $("#Address").append(selects);
        }
    });
});
function doinsert(){

    $.ajax({
        url: "insert_insert.do",
        type: "post",
        data: "FirstName=" + $("#FirstName").val() + "&LastName=" + $("#LastName").val() + "&Address=" + $("#Address").val() + "&Email=" + $("#Email").val(),
        async: true,
    });
    alert("新建成功！");
    location="index.jsp";
}