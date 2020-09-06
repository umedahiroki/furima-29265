
//入力した値を計算する処理
function calculation(){

    //入力値の要素を取得
    const tagInput = document.getElementById("item-price");

    //入力した時のイベント設定
    tagInput.addEventListener('keyup', () => {
    
    //取得した要素を変数に代入
    const amount = tagInput.value

    //取得した値から手数料を計算
    const tax_sum = Math.ceil(amount * 0.1);

    //取得した値から利益率を計算
    const profit_sum = Math.floor(amount * 0.9);
    
    //taxを別の入力フォームに表示する
    const tax = document.getElementById("add-tax-price");
    tax.innerHTML = tax_sum;

    //profitを別の入力フォームに表示する
    const profit = document.getElementById("profit");
    profit.innerHTML = profit_sum;
    
 });
}
window.addEventListener("load", calculation);

