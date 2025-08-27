const km = 1
const anosLuz = km / 9.46 * Math.pow(10, 12)

console.log(anosLuz.toLocaleString('pt-BR', { maximumFractionDigits: 2 }))