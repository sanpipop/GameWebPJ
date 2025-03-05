const pianoKeys = document.querySelectorAll(".piano-keys .key"),
volumeSlider = document.querySelector(".volumn-slider input"),
keyCheckbox = document.querySelector(".keys-checkbox input");

let allKeys = [],
audio = new Audio("tunes/a.wav")

const playTune = (key) => {
    audio.src = `tunes/${key}.wav`
    audio.play();
    console.log(allKeys);
    const clickedKey = document.querySelector(`[data-key=${key}]`);
    clickedKey.classList.add("active");
    setTimeout(()=>{
        clickedKey.classList.remove("active");
    }, 150);
}
pianoKeys.forEach(key => {
    allKeys.push(key.dataset.key);
    key.addEventListener("click", () => playTune(key.dataset.key));
    
});

const handleVolume  = (e) => {
    audio.volume = e.target.value;
}

const showHidekeys = () => {
    pianoKeys.forEach(key => key.classList.toggle("hide"));
}

const pressedKey = (e) => {
    if(allKeys.includes(e.key)){
        playTune(e.key);
    }
    
}
keyCheckbox.addEventListener("click", showHidekeys);
volumeSlider.addEventListener("input", handleVolume)
document.addEventListener("keydown", pressedKey);