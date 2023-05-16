window.addEventListener('load', function(){

  const inputPrice = document.getElementById("item-price")
  inputPrice.addEventListener("input",function(){
    const addTaxPrice = inputPrice.value - 0.1
    document.getElementById("add-tax-price").textContent = addTaxPrice;
  });
})