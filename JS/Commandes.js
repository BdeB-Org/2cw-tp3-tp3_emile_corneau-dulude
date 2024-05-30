const url = "http://localhost:8080/ords/h2r/commandes";
const table = document.getElementById("table");

fetch(url)
  .then((resp) => resp.json())
  .then(function (data) {
    let commandes = data.items;

    commandes.forEach(function (commande) {
      let row = table.insertRow();
      let cell1 = row.insertCell();
      cell1.innerHTML = `${commande.nom_item}`;
      let cell2 = row.insertCell();
      cell2.innerHTML = `${commande.prix}`;
    });
  })
  .catch(function (error) {
    console.log(JSON.stringify(error));
  });