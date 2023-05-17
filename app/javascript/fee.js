window.addEventListener('load', function(){

  const price = document.getElementById("item-price")
  price.addEventListener("input",function(){
    const addTaxPrice = price.value * 0.1
    document.getElementById("add-tax-price").textContent = addTaxPrice;
    const profit = price.value - addTaxPrice
    document.getElementById("profit").textContent = profit;
  });
})