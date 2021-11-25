const ELEMENTAL_LINES = [
  [11, "Na", "sodium", 1.04, 1.04, 1.07],
  // [12, "Mg", "magnesium", 1.25, 1.25, 1.30],
  // [13, "Al", "aluminium", 1.48, 1.49, 1.56],
  // [14, "Si", "silicon", 1.74, 1.74, 1.84],
  // [15, "P", "phosphorus", 2.01, 2.01, 2.14],
  [16, "S", "sulfur", 2.31, 2.31, 2.46],
  [17, "Cl", "chlorine", 2.62, 2.62, 2.81],
  // [18, "Ar", "argon", 2.96, 2.96, 3.19],
  [19, "K", "potassium", 3.31, 3.31, 3.59],
  [20, "Ca", "calcium", 3.69, 3.69, 4.01, 0.34, 0.34, 0.35],
  // [21, "Sc", "scandium", 4.09, 4.09, 4.46, 0.40, 0.40, 0.40],
  [22, "Ti", "titanium", 4.51, 4.50, 4.93, 0.45, 0.45, 0.46],
  // [23, "V", "vanadium", 4.95, 4.94, 5.43, 0.51, 0.51, 0.52],
  // [24, "Cr", "chromium", 5.41, 5.41, 5.95, 0.57, 0.57, 0.58],
  [25, "Mn", "manganese", 5.90, 5.89, 6.49, 0.64, 0.64, 0.65],
  [26, "Fe", "iron", 6.40, 6.39, 7.06, 0.71, 0.71, 0.72],
  // [26, "Co", "cobalt", 6.93, 6.92, 7.65, 0.78, 0.78, 0.79],
  // [28, "Ni", "nickel", 7.48, 7.46, 8.26, 0.85, 0.85, 0.87],
  [29, "Cu", "copper", 8.05, 8.03, 8.91, 0.93, 0.93, 0.95],
  // [30, "Zn", "zinc", 8.64, 8.62, 9.57, 1.01, 1.01, 1.03],
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
  // [59, "Pr", "praseodymium", 36.03, 35.55, 40.75, 5.03, 5.01, 5.49, 5.85, 6.32, 0.9],
  // [60, "Nd", "neodymium", 37.36, 36.85, 42.27, 5.23, 5.21, 5.72, 6.09, 6.60, 0.98],
  // [61, "Pm", "promethium", 38.72, 38.17, 43.83, 5.43, 5.41, 5.96, 6.34, 6.89],
  // [62, "Sm", "samarium", 40.12, 39.52, 45.41, 5.64, 5.61, 6.21, 6.59, 7.18, 1.08],
  // [63, "Eu", "europium", 41.54, 40.90, 47.04, 5.85, 5.82, 6.46, 6.84, 7.48, 1.13],
  // [64, "Gd", "gadolinium", 43.00, 42.31, 48.70, 6.06, 6.03, 6.71, 7.10, 7.79, 1.19],
  // [65, "Tb", "terbium", 44.48, 43.74, 50.38, 6.27, 6.24, 6.98, 7.37, 8.10, 1.24],
  // [66, "Dy", "dysprosium", 46.00, 45.21, 52.11, 6.50, 6.46, 7.25, 7.64, 8.42, 1.29],
  // [67, "Ho", "holmium", 47.55, 46.70, 53.88, 6.72, 6.68, 7.53, 7.91, 8.75, 1.35],
  // [68, "Er", "erbium", 49.13, 48.22, 55.68, 6.95, 6.91, 7.81, 8.19, 9.09, 1.41],
  // [69, "Tm", "thulium", 50.74, 49.77, 57.52, 7.18, 7.13, 8.10, 8.47, 9.43, 1.46],
  // [70, "Yb", "ytterbium", 52.39, 51.35, 59.37, 7.42, 7.37, 8.40, 8.76, 9.78, 1.52],
  // [71, "Lu", "lutetium", 54.07, 52.97, 61.28, 7.66, 7.60, 8.71, 9.05, 10.14, 1.58],
  // [72, "Hf", "hafnium", 55.79, 54.61, 63.23, 7.90, 7.84, 9.02, 9.35, 10.52, 1.64],
  // [73, "Ta", "tantalum", 57.53, 56.28, 65.33, 8.15, 8.09, 9.34, 9.65, 10.90, 1.71],
  // [74, "W", "tungsten", 59.32, 57.98, 67.24, 8.40, 8.34, 9.67, 9.96, 11.29, 1.78],
  // [75, "Re", "rhenium", 61.14, 59.72, 69.31, 8.65, 8.59, 10.01, 10.28, 11.69, 1.84],
  // [76, "Os", "osmium", 63.00, 61.49, 71.41, 8.91, 8.84, 10.36, 10.60, 12.10, 1.91],
  // [77, "Ir", "iridium", 64.90, 63.29, 73.56, 9.18, 9.10, 10.71, 10.92, 12.51, 1.98],
  // [78, "Pt", "platinum", 66.83, 65.11, 75.75, 9.44, 9.36, 11.07, 11.25, 12.94, 2.05],
  // [79, "Au", "gold", 68.80, 66.99, 77.98, 9.71, 9.63, 11.44, 11.58, 13.38, 2.12],
  // [80, "Hg", "mercury", 70.82, 68.90, 80.25, 9.99, 9.90, 11.82, 11.92, 13.83, 2.20],
  // [81, "Tl", "thallium", 72.87, 70.83, 82.58, 10.27, 10.17, 12.21, 12.27, 14.29, 2.27],
  // [82, "Pb", "lead", 74.97, 72.80, 84.94, 10.55, 10.45, 12.61, 12.62, 14.76, 2.35],
  // [83, "Bi", "bismuth", 77.11, 74.81, 87.34, 10.84, 10.73, 13.02, 12.98, 15.25, 2.42],
  // [84, "Po", "polonium", 79.29, 76.86, 89.80, 11.13, 11.02, 13.45, 13.34, 15.74],
  // [85, "At", "astatine", 81.52, 78.95, 92.30, 11.43, 11.30, 13.88, 16.25],
  // [86, "Rn", "radon", 83.78, 81.07, 94.87, 11.73, 11.60, 14.32, 16.77],
  // [87, "Fr", "francium", 86.10, 83.23, 97.47, 12.03, 11.90, 14.77, 14.45, 17.30],
  // [88, "Ra", "radium", 88.47, 85.43, 100.13, 12.34, 12.20, 15.24, 14.84, 17.85],
  // [89, "Ac", "actinium", 90.88, 87.67, 102.85, 12.65, 12.50, 15.71, 18.41],
  // [90, "Th", "thorium", 93.35, 89.95, 105.61, 12.97, 12.81, 16.20, 15.62, 18.98, 3.00],
  // [91, "Pa", "protactinium", 95.87, 92.29, 108.43, 13.29, 13.12, 16.70, 16.02, 19.57, 3.08],
  // [92, "U", "uranium", 98.44, 94.67, 111.30, 13.61, 13.44, 17.22, 16.43, 20.17, 3.17]
];


function showSpectrum(jcampUrl, targetElementId, insertionMode='replace', smoothing=5) {
  /**
 * Plots a jcamp-dx file.
 *
 * @jcampUrl        url to the jcamp-dx file that should be visualized
 * @targetElementId id of DOM-Element, where the plot should be inserted
 * @insertionMode   how the plot should be inserted. valid values: 'replace' (replaces the element), 'append' (appends to the element as a child)
 * @smoothing       window size for a simple moving average smoothing of the spectrum
 */

  fetch(jcampUrl, {mode: 'cors'}).then((r)=>{r.text().then((d)=>{
    // parse jcamp file
    var jcampLines = d.split(/\r\n|\n/);
    var datatype = '';
    var isXRF = false;
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
    // for xrf spectra, we want to show elemental lines, which requires some extra computations
    isXRF = datatype.toUpperCase().includes('XRF');
    // second pass: get data (needs some of the metadata)
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

    // smooth the spectrum
    const s = Math.floor(smoothing / 2);
    var y = spectralData.map((p) => p[yunits]);
    var yFilt = [...y];
    for (var i=0; i<y.length; i++){
      var lower = Math.max(i-s, 0);
      var upper = Math.min(i+s, y.length);
      yFilt[i] = y.slice(lower, upper).reduce((a, b) => a+b) / (upper-lower);
    }
    // write the smoothed values back to the original spectrum.. i am sure there is a more elegant way for this.
    for(var i=0; i<spectralData.length; i++){
      spectralData[i][yunits] = yFilt[i];
    }


    // xrf specific stuff
    if (isXRF){
      //seems like in our applications, only the first half of the spectrum is interesting (TODO: check if this is true)
      spectralData = spectralData.slice(0, spectralData.length/2);

      // TODO: add peak lines. For demonstration, nuw just the lines of some important elements are drawn..
      var peaks = ELEMENTAL_LINES.map((row) => {
        return {
          number: row[0],
          symbol: row[1],
          name: row[2],
          kAlpha1: row[3],
          kAlpha2: row[4],
          kBeta: row[5]
        }
      })
    }
    
    //make the plot
    var plotmarks = [
      Plot.line(spectralData, {
        x: xunits,
        y: yunits,
        stroke: '#885457',
        sort: xunits
      })];
    if (isXRF){
      plotmarks.push(Plot.ruleX(peaks, {x: 'kAlpha1'}),
                     Plot.text(peaks, {x: 'kAlpha1', y: -10, text: 'symbol'}));
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
    if (insertionMode == 'replace'){
      plot.id = targetElementId;
      document.getElementById(targetElementId).replaceWith(plot);
    } else if (insertionMode == 'append'){
      document.getElementById(targetElementId).appendChild(plot);
    } else{
      console.error("Invalid insertionMode provided to showSpectrum() - valid values: 'replace', 'insert'.");
    }

  }, reason => {console.log(reason)})
}, reason => {console.log(reason)})
}

