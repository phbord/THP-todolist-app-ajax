function ifChecked() {
    if (!document.querySelectorAll(".task-cb")[0]) return;
    let cbElt = document.querySelectorAll(".task-cb");
    for (let i = 0; i < cbElt.length; i++) {
        cbElt[i].addEventListener('change', function(e) {
            let that = e.currentTarget;
            let id = that.getAttribute('id');
            let dataId = that.getAttribute('data-id');
            let isChecked = that.checked;
            let dataParams = `id=${dataId}&status=${isChecked}`;

            that.setAttribute('data-params', dataParams);
        });
    }
}

document.addEventListener('DOMContentLoaded', () => {
    ifChecked();
}, false);
