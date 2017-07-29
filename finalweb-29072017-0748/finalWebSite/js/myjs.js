function EditMode(el, isEdit) {
    $("tbody td input").hide();


    $("tbody td span").show();
    if (isEdit) {
        $(el).hide();
        $(el).next().show();
    } else {
        $(el).hide();
        $(el).prev().show();
    }
}