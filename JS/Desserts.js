const url = "http://localhost:8080/ords/h2r/desserts";
const table = document.getElementById("table");

fetch(url)
  .then((resp) => resp.json())
  .then(function (data) {
    let desserts = data.items;

    desserts.forEach(function (dessert) {
      let row = table.insertRow();
      let cell1 = row.insertCell();
      cell1.innerHTML = `${dessert.nom_dessert}`;
      let cell2 = row.insertCell();
      cell2.innerHTML = `${dessert.prix}`;
      let cell3 = row.insertCell();
      cell3.innerHTML = `${dessert.review} &#128077;`;
      let cell4 = row.insertCell();
      cell4.innerHTML = `<button class="order-btn">Commander</button>`;
    });
  })
  .catch(function (error) {
    console.log(JSON.stringify(error));
  });


document.querySelectorAll('.order-btn').forEach(button => {
    button.addEventListener('click', () => {
        const itemPrice = row.children[1].textContent;

        alert('Order placed for ' + itemPrice);
    });
});