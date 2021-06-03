function changeEmailBgColor() {
    if (!document.querySelectorAll(".list-group-item")[0]) return;

    let itemElt = document.querySelectorAll(".list-group-item");

    for (let i = 0; i < itemElt.length; i++) {
        itemElt[i].addEventListener('click', function(e) {
            e.preventDefault();
            let that = e.currentTarget;
            addEmailBgColor(that);
            removeEmailBgColor();
        });
    }
}

function addEmailBgColor(elt) {
    let linkElt = elt.querySelector("a.class_link");
    let linkHiddenElt = elt.querySelector("a.class_link_hidden");
    elt.classList.add('bg-primary');
    linkElt.classList.add('text-white');
    linkElt.click();
    linkHiddenElt.click();
}

function removeEmailBgColor() {
    if (!document.querySelectorAll(".btn-read")[0]) return;

    let btnElt = document.querySelectorAll(".btn-read")[0];
    console.log('>>>> ',btnElt);
    btnElt.addEventListener('click', function(e) {
        e.preventDefault();
        let that = e.currentTarget;
        let id = that.getAttribute('data-id');
        console.log(id);
    });
}


document.addEventListener('DOMContentLoaded', () => {
    changeEmailBgColor();
}, false);