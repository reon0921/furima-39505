window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    let inputValue = priceInput.value;
    inputValue = Math.floor(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = fee;
    const profitDom = document.getElementById("profit");
    const profit = Math.floor(inputValue - fee);
    profitDom.innerHTML = profit;
  });
});
