import {dbank} from "../../declarations/dbank"

window.addEventListener("load", async function() {
    //console.log("finishing loading window");
    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerText = currentAmount.toFixed(2);
});

document.querySelector("form").addEventListener("submit", async function() {
    event.preventDefault();

    const button = event.target.querySelector("#submit-btn");

    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    button.setAttribute("disabled", true);
    
    if(document.getElementById("input-amount").value.length != 0) {
        await dbank.topUp(inputAmount);
        await dbank.compound();
    }
    if(document.getElementById("withdrawal-amount").value.length != 0) {
        await dbank.withdraw(outputAmount);
    }

    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerText = currentAmount.toFixed(2);

    document.getElementById("input-amount").value = "";
    document.getElementById("withdrawal-amount").value = "";

    button.removeAttribute("disabled");
})