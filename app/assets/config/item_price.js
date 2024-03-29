window.addEventListener('turbo:load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = fee;
    const profitDom = document.getElementById("profit");
    const profit = inputValue - fee;
    profitDom.innerHTML = profit;
  });
});