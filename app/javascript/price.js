window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");

    priceInput.addEventListener("input", () => {

     const Tax_price = document.getElementById("add-tax-price");
      Tax_price.innerHTML = Math.round(priceInput.value * 0.1 );

     const Profit_price = document.getElementById("profit");
      Profit_price.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
 })
});