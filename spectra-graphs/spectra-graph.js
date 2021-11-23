const ELEMENTAL_LINES = [
  [16, "S", "sulfur", 2.31, 2.31, 2.46],
  //[17, "Cl", "chlorine", 2.62, 2.62, 2.81],
  // [18, "Ar", "argon", 2.96, 2.96, 3.19],
  [19, "K", "potassium", 3.31, 3.31, 3.59],
  //[20, "Ca", "calcium", 3.69, 3.69, 4.01, 0.34, 0.34, 0.35],
  // [21, "Sc", "scandium", 4.09, 4.09, 4.46, 0.40, 0.40, 0.40],
  // [22, "Ti", "titanium", 4.51, 4.50, 4.93, 0.45, 0.45, 0.46],
  // [23, "V", "vanadium", 4.95, 4.94, 5.43, 0.51, 0.51, 0.52],
  // [24, "Cr", "chromium", 5.41, 5.41, 5.95, 0.57, 0.57, 0.58],
  // [25, "Mn", "manganese", 5.90, 5.89, 6.49, 0.64, 0.64, 0.65],
  [26, "Fe", "iron", 6.40, 6.39, 7.06, 0.71, 0.71, 0.72],
  // [26, "Co", "cobalt", 6.93, 6.92, 7.65, 0.78, 0.78, 0.79],
  // [28, "Ni", "nickel", 7.48, 7.46, 8.26, 0.85, 0.85, 0.87],
  [29, "Cu", "copper", 8.05, 8.03, 8.91, 0.93, 0.93, 0.95],
  //[30, "Zn", "zinc", 8.64, 8.62, 9.57, 1.01, 1.01, 1.03],
  // [31, "Ga", "gallium", 9.25, 9.22, 10.26, 1.10, 1.10, 1.12],
  // [32, "Ge", "germanium", 9.89, 9.86, 10.98, 1.19, 1.19, 1.22],
  // [33, "As", "arsenic", 10.54, 10.51, 11.73, 1.28, 1.28, 1.32],
  // [34, "Se", "selenium", 11.22, 11.18, 12.50, 1.38, 1.38, 1.42],
  // [35, "Br", "bromine", 11.92, 11.88, 13.29, 1.48, 1.48, 1.53],
  // [36, "Kr", "krypton", 12.65, 12.60, 14.11, 1.59, 1.59, 1.64],
  // [37, "Rb", "rubidium", 13.40, 13.34, 14.96, 1.69, 1.69, 1.75],
  // [38, "Sr", "strontium", 14.17, 14.10, 15.84, 1.81, 1.80, 1.87],
  // [39, "Y", "yttrium", 14.96, 14.88, 16.74, 1.92, 1.92, 2.00],
  // [40, "Zr", "zirconium", 15.78, 15.69, 17.67, 2.04, 2.04, 2.12, 2.22, 2.30],
  // [41, "Nb", "niobium", 16.62, 16.52, 18.62, 2.17, 2.16, 2.26, 2.37, 2.46],
  // [42, "Mo", "molybdenum", 17.48, 17.37, 19.61, 2.29, 2.29, 2.39, 2.52, 2.62],
  // [43, "Tc", "technetium", 18.37, 18.25, 20.62, 2.42, 2.42, 2.54, 2.67, 2.79],
  // [44, "Ru", "ruthenium", 19.28, 19.15, 21.66, 2.56, 2.55, 2.68, 2.84, 2.96],
  // [45, "Rh", "rhodium", 20.22, 20.07, 22.72, 2.70, 2.69, 2.83, 3.00, 3.14],
  // [46, "Pd", "palladium", 21.18, 21.02, 23.82, 2.84, 2.83, 2.99, 3.17, 3.33],
  // [47, "Ag", "silver", 22.16, 21.99, 24.94, 2.98, 2.98, 3.15, 3.35, 3.52],
  // [48, "Cd", "cadmium", 23.17, 22.98, 26.10, 3.13, 3.13, 3.32, 3.53, 3.72],
  // [49, "In", "indium", 24.21, 24.00, 27.28, 3.29, 3.28, 3.49, 3.71, 3.92],
  // [50, "Sn", "tin", 25.27, 25.04, 28.49, 3.44, 3.44, 3.66, 3.90, 4.13],
  // [51, "Sb", "antimony", 26.36, 26.11, 29.73, 3.60, 3.60, 3.84, 4.10, 4.35],
  // [52, "Te", "tellurium", 27.47, 27.20, 31.00, 3.77, 3.76, 4.03, 4.30, 4.57],
  // [53, "I", "iodine", 28.61, 28.32, 32.29, 3.94, 3.93, 4.22, 4.51, 4.80],
  // [54, "Xe", "xenon", 29.78, 29.46, 33.62, 4.11],
  // [55, "Cs", "caesium", 30.97, 30.63, 34.99, 4.29, 4.27, 4.62, 4.94, 5.28],
  // [56, "Ba", "barium", 32.19, 31.82, 36.38, 4.47, 4.45, 4.83, 5.16, 5.53],
  // [57, "La", "lanthanum", 33.44, 33.03, 37.80, 4.65, 4.63, 5.04, 5.38, 5.79, 0.8],
  // [58, "Ce", "cerium", 34.72, 34.28, 39.28, 4.84, 4.82, 5.26, 5.61, 6.05, 0.8],
  // [59, "Pr", "praseodymium", 36.03, 35.55, 40.75, 5.03, 5.01, 5.49, 5.85, 6.32, 0.9]
];


function showSpectrum(url, target_element_id) {
  fetch(url, {mode: 'cors'}).then((r)=>{r.text().then((d)=>{
    // parse jcamp file
    var jcampLines = d.split(/\r\n|\n/);
    var datatype = ''
    var spectralData = [];
    var xunits = '';
    var yunits = '';
    var deltax = 0;
    // first pass: get metadata
    jcampLines.some((line) => {
      elems = line.split(/= /);
      if (elems.length >= 2){
        if (elems[0] == '##XUNITS')
          xunits = elems[1];
        else if (elems[0] == '##YUNITS')
          yunits = elems[1];
        else if (elems[0] == '##DELTAX')
          deltax = Number(elems[1]);
        else if (elems[0] == '##DATA TYPE')
          datatype = elems[1];
      }
      return xunits != '' && yunits != '' && deltax !=0 && datatype!='';  //if we have read these values, we are done.
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

    var elemental_lines = ELEMENTAL_LINES.map((x) => {
      return {
        periodic_number: x[0],
        symbol: x[1],
        name: x[2],
        line_alpha1: x[3],
        line_alpha2: x[4],
        line_beta: x[5]
      }
    })
    
    //make the plot
    var plotmarks = [
      Plot.line(spectralData, {
        x: xunits,
        y: yunits,
        stroke: '#885457',
        sort: xunits
      })]
    if (datatype.toUpperCase().includes('XRF')){
      plotmarks.push(Plot.ruleX(elemental_lines, {x: 'line_alpha1'}),
                     Plot.text(elemental_lines, {x: 'line_alpha1', y: -10, text: 'symbol'}));
    }
    
    var plot  = Plot.plot({
      y: {
        grid: true
      },
      x: {
        reverse: deltax<0
      },
      marks: plotmarks
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

