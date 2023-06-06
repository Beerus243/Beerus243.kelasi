function classToggle() {
  var el = document.querySelector('.icon-cards__content');
  el.classList.toggle('step-animation');
}

document.querySelector('#toggle-animation').addEventListener('click', classToggle);

var presenceBtn = document.getElementById("presence-btn");
var presenceModal = document.getElementById("presence-modal");
var presenceContent = document.getElementById("presence-content");

var applicationBtn = document.getElementById("application-btn");
var applicationModal = document.getElementById("application-modal");
var applicationContent = document.getElementById("application-content");

var pourcentageBtn = document.getElementById("pourcentage-btn");
var pourcentageModal = document.getElementById("pourcentage-modal");
var pourcentageContent = document.getElementById("pourcentage-content");

var noteBtn = document.getElementById("note-btn");
var noteModal = document.getElementById("note-modal");
var noteContent = document.getElementById("note-content");

var coursBtn = document.getElementById("cours-btn");
var coursModal = document.getElementById("cours-modal");
var coursContent = document.getElementById("cours-content");

var closeButtons = document.getElementsByClassName("close");

// Fonction pour ouvrir le modal
function openModal(modal) {
  modal.style.display = "block";
}

// Fonction pour fermer le modal
function closeModal(modal) {
  modal.style.display = "none";
}

// Bouton Présence
presenceBtn.onclick = function() {
  openModal(presenceModal);
  getPresence();
}

// Bouton Application
applicationBtn.onclick = function() {
  openModal(applicationModal);
  getApplication();
}

// Bouton Pourcentage
pourcentageBtn.onclick = function() {
  openModal(pourcentageModal);
  getPourcentage();
}

// Bouton Note
noteBtn.onclick = function() {
  openModal(noteModal);
  getNote();
}

// Bouton Cours
coursBtn.onclick = function() {
  openModal(coursModal);
  getCours();
}

// Fermer le modal lorsqu'on clique sur la croix ou en dehors du modal
for (var i = 0; i < closeButtons.length; i++) {
  closeButtons[i].onclick = function() {
    var modal = this.parentElement.parentElement;
    closeModal(modal);
  }
  window.onclick = function(event) {
    if (event.target.classList.contains("modal")) {
      closeModal(event.target);
    }
  }
}

// Récupérer les informations de Présence
function getPresence() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      presenceContent.innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "fetch_presence.php", true);
  xhttp.send();
}

// Récupérer les informations d'Application
function getApplication() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      applicationContent.innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "fetch_application.php", true);
  xhttp.send();
}

// Récupérer les informations de Pourcentage
function getPourcentage() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      pourcentageContent.innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "fetch_pourcentage.php", true);
  xhttp.send();
}

// Récupérer les informations de Note
function getNote() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      noteContent.innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "fetch_note.php", true);
  xhttp.send();
}

// Récupérer les informations de Cours
function getCours() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      coursContent.innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "fetch_cours.php", true);
  xhttp.send();
}