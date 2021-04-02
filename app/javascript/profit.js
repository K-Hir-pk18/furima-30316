window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const ProfitDom = document.getElementById("profit");
    ProfitDom.innerHTML = inputValue - Math.floor(inputValue * 0.1)
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
  });
  })
  