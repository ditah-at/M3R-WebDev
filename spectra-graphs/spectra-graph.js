function loadJcamp(path){
    var file = new File(['asdf'], path, {type: "text/plain"})
    if (!path) {
        return;
    }
    var reader = new FileReader();
    // reader.onload = function(e) {
    //     var contents = e.target.result;
    //     displayContents(contents);
    // };
    var content = reader.readAsText(file);
    return content
}




function showSpectrum() {
    loadJcamp('./exampledata/FTIR.MP01.jdx')
    const csvUrl =
      'https://gist.githubusercontent.com/curran/a08a1080b88344b0c8a7' +
      '/raw/0e7a9b0a5d22642a06d3d5b9bcbad9890c8ee534/iris.csv';
    d3.csv(csvUrl, d3.autoType).then((data) => {
        var sorted = data.sort(function(a, b) {return a.petal_length - b.petal_length;});
        var plot  = Plot.plot({
        width: window.innerWidth,
        height: window.innerHeight,
        marks: [
          Plot.line(sorted, {
            x: 'petal_length',
            y: 'petal_width'
          }),
        ],
      })
        document.getElementById("graphcontainer").appendChild(plot);
    });

    
}

