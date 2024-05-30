const url = "http://localhost:8080/ords/h2r/sandwichs";
const table = document.getElementById("table");

fetch(url)
  .then((resp) => resp.json())
  .then(function (data) {
    let sandwichs = data.items;

    sandwichs.forEach(function (sandwich) {
      let row = table.insertRow();
      let cell1 = row.insertCell();
      cell1.innerHTML = `${sandwich.nom}`;
      let cell2 = row.insertCell();
      cell2.innerHTML = `${sandwich.prix}`;
      let cell3 = row.insertCell();
      cell3.innerHTML = `${sandwich.review} &#128077;`;
      let cell4 = row.insertCell();
      cell4.innerHTML = `<button class="order-btn">Commander</button>`;
    });
  })
  .catch(function (error) {
    console.log(JSON.stringify(error));
  });


document.querySelectorAll('.order-btn').forEach(button => {
    button.addEventListener('click', () => {
        const sandwichPrice = row.children[1].textContent;

        alert('Order placed for ' + sandwichPrice);
    });
});