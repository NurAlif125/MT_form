var xmldata = document.getElementById("hiddenmxfull").value;
//    console.log(xmldata);
new DataTree({
    xml: xmldata,
    container: '#mxfull',
    attrs: 'show',
    startExpanded: true
});