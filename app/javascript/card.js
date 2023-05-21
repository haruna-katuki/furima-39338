const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expMonthElement = elements.create('cardExpiry', { 'dateType': 'month' });
  const expYearElement = elements.create('cardExpiry', { 'dateType': 'year' });
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');
  expMonthElement.mount('#card-exp-month');
  expYearElement.mount('#card-exp-year');
  cvcElement.mount('#card-cvc');

  submit.addEventListener("click", () => {
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }
      numberElement.clear();
      expMonthElement.clear();
      expYearElement.clear();
      cvcElement.clear();
    });
  });
}

window.addEventListener("load", pay);