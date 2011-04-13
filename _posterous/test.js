var tim = new Date();

function pad(n) {
  return n < 9 ? '0' + n : n;
}
datestamp = tim.getFullYear() + "-" + pad(tim.getMonth()) + "-" + pad(tim.getDate()) + "-";

console.log(datestamp);
