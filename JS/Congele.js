const url = "http://localhost:8080/ords/h2r/congeles";
const table = document.getElementById("table");

fetch(url)
  .then((resp) => resp.json())
  .then(function (data) {
    let congeles = data.items;

    congeles.forEach(function (congele) {
      let row = table.insertRow();
      let cell1 = row.insertCell();
      cell1.innerHTML = `${congele.nom_congele}`;
      let cell2 = row.insertCell();
      cell2.innerHTML = `${congele.prix}`;
      let cell3 = row.insertCell();
      cell3.innerHTML = `${congele.review} &#128077;`;
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