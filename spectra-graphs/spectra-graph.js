function showSpectrum(url, target_element_id) {
  fetch(url, {mode: 'cors'}).then((r)=>{r.text().then((d)=>{
    // parse jcamp file
    var jcampLines = d.split(/\r\n|\n/);
    var spectralData = [];
    var xunits = '';
    var yunits = '';
    var deltax = 0;
    // first pass: get metadata
    jcampLines.some((line) => {
      elems = line.split(/ (.+)/);
      if (elems.length >= 2){
        if (elems[0] == '##XUNITS=')
          xunits = elems[1];
        else if (elems[0] == '##YUNITS=')
          yunits = elems[1];
        else if (elems[0] == '##DELTAX=')
          deltax = Number(elems[1]);
      }
      return xunits != '' && yunits != '' && deltax !=0;  //if we have read these values, we are done.
    });
    // second pass: read spectrum (needs some of the metadata)
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

    // sort values. perhaps this is not necessary, but let's be sure.
    // if (deltax > 0)
    //   spectralData = spectralData.sort(function(a, b) {return a.xunit - b.xunit;});
    // if (deltax < 0)
    //   spectralData = spectralData.sort(function(a, b) {return b.xunit - a.xunit;});
    
    //make the plot
    var plot  = Plot.plot({
      y: {
        grid: true
      },
      x: {
        reverse: deltax<0
      },
      marks: [
        Plot.line(spectralData, {
          x: xunits,
          y: yunits,
          stroke: '#885457',
          sort: xunits
        }),
      ]
    });
    
    //insert into DOM
    //version 1: replace an element
    plot.id = target_element_id;
    document.getElementById(target_element_id).replaceWith(plot);
    //version 2: append a child to an element
    //document.getElementById(parent_id).appendChild(plot);

  }, reason => {console.log(reason)})
}, reason => {console.log(reason)})
}

