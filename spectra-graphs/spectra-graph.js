function showSpectrum(url, target_element_id) {
  fetch(url, {mode: 'cors'}).then((r)=>{r.text().then((d)=>{
    var jcampLines = d.split(/\r\n|\n/);
    var spectralData = [];
    var xunits = '';
    var yunits = '';
    jcampLines.some((line) => {
      elems = line.split(/ (.+)/);
      if (elems.length >= 2){
        if (elems[0] == '##XUNITS=')
          xunits = elems[1];
        else if (elems[0] == '##YUNITS=')
          yunits = elems[1];
      }
      return xunits != '' && yunits != '';
    });
    jcampLines.forEach((line) => {
      elems = line.split(/ (.+)/);
      if (elems.length >= 2){
        if (!isNaN(elems[0]) && !isNaN(elems[1])){
          var point = {};
          point[xunits] = Number(elems[0]);
          point[yunits] = Number(elems[1]);
          spectralData.push(point);
        }
      }
    });

    //var sorted = spectralData.sort(function(a, b) {return a.xunit - b.yunit;});
    var plot  = Plot.plot({
      width: 500,
      height: 300,
      y: {
        grid: true
      },
      marks: [
        Plot.line(spectralData, {
          x: xunits,
          y: yunits
        }),
      ],
    });
    
    plot.id = target_element_id;
    document.getElementById(target_element_id).replaceWith(plot);
    //document.getElementById(parent_id).appendChild(plot);

  }, reason => {console.log(reason)})
}, reason => {console.log(reason)})
}

