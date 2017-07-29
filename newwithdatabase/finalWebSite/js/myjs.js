function EditMode(el, isEdit) {
    $("tbody td input").hide();

    if ($("tbody td input").val == '') {
        $("tbody td span").html("0");
    }

    $("tbody td span").show();
    if (isEdit) {
        $(el).hide();
        $(el).next().show();
    } else {
        $(el).hide();
        $(el).prev().show();
    }
}