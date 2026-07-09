/*==========================================================
VISHNU IT SOLUTIONS
PREMIUM STARTUP WEBSITE
==========================================================*/

document.addEventListener("DOMContentLoaded", () => {

initializeLoader();
initializeNavbar();
initializeSmoothScroll();
initializeRevealAnimation();
initializeProgressBar();
initializeCounter();
initializeTypingEffect();

});

/*==========================================================
PAGE LOADER
==========================================================*/

function initializeLoader(){

const loader=document.querySelector(".loader");

if(loader){

window.addEventListener("load",()=>{

loader.classList.add("loader-hide");

setTimeout(()=>{

loader.remove();

},700);

});

}

}

/*==========================================================
NAVBAR SCROLL
==========================================================*/

function initializeNavbar(){

const navbar=document.querySelector("header");

window.addEventListener("scroll",()=>{

if(window.scrollY>50){

navbar.classList.add("sticky");

}

else{

navbar.classList.remove("sticky");

}

});

}

/*==========================================================
SMOOTH SCROLL
==========================================================*/

function initializeSmoothScroll(){

document.querySelectorAll('a[href^="#"]').forEach(anchor=>{

anchor.addEventListener("click",function(e){

e.preventDefault();

const target=document.querySelector(this.getAttribute("href"));

if(target){

target.scrollIntoView({

behavior:"smooth"

});

}

});

});

}

/*==========================================================
SCROLL PROGRESS BAR
==========================================================*/

function initializeProgressBar(){

const progress=document.querySelector(".progress-bar");

window.addEventListener("scroll",()=>{

const scrollTop=document.documentElement.scrollTop;

const scrollHeight=document.documentElement.scrollHeight-document.documentElement.clientHeight;

const percentage=(scrollTop/scrollHeight)*100;

if(progress){

progress.style.width=percentage+"%";

}

});

}

/*==========================================================
REVEAL ANIMATION
==========================================================*/

function initializeRevealAnimation(){

const reveals=document.querySelectorAll(".reveal");

function reveal(){

const windowHeight=window.innerHeight;

reveals.forEach(item=>{

const top=item.getBoundingClientRect().top;

if(top<windowHeight-120){

item.classList.add("active");

}

});

}

window.addEventListener("scroll",reveal);

reveal();

}

/*==========================================================
COUNTER
==========================================================*/

function initializeCounter(){

const counters=document.querySelectorAll(".counter");

const speed=200;

counters.forEach(counter=>{

const update=()=>{

const target=+counter.getAttribute("data-target");

const count=+counter.innerText;

const increment=target/speed;

if(count<target){

counter.innerText=Math.ceil(count+increment);

setTimeout(update,10);

}

else{

counter.innerText=target;

}

};

update();

});

}

/*==========================================================
TYPEWRITER
==========================================================*/

function initializeTypingEffect(){

const element=document.querySelector(".typing");

if(!element) return;

const words=[

"Cloud Solutions",

"DevOps Automation",

"AWS Infrastructure",

"Enterprise Applications",

"Digital Transformation"

];

let wordIndex=0;

let charIndex=0;

let deleting=false;

function type(){

const current=words[wordIndex];

if(!deleting){

element.textContent=current.substring(0,charIndex++);

if(charIndex>current.length){

deleting=true;

setTimeout(type,1800);

return;

}

}

else{

element.textContent=current.substring(0,charIndex--);

if(charIndex===0){

deleting=false;

wordIndex++;

if(wordIndex>=words.length){

wordIndex=0;

}

}

}

setTimeout(type,deleting?60:110);

}

type();

}
/*==========================================================
MOUSE GLOW EFFECT
==========================================================*/

const glow = document.createElement("div");

glow.className = "mouse-glow";

document.body.appendChild(glow);

document.addEventListener("mousemove",(e)=>{

    glow.style.left=e.clientX+"px";
    glow.style.top=e.clientY+"px";

});

/*==========================================================
FLOATING PARTICLES
==========================================================*/

function createParticle(){

    const particle=document.createElement("span");

    particle.className="particle";

    particle.style.left=Math.random()*window.innerWidth+"px";

    particle.style.animationDuration=(5+Math.random()*5)+"s";

    particle.style.opacity=Math.random();

    particle.style.width=(4+Math.random()*8)+"px";

    particle.style.height=particle.style.width;

    document.body.appendChild(particle);

    setTimeout(()=>{

        particle.remove();

    },10000);

}

setInterval(createParticle,350);

/*==========================================================
ACTIVE NAVBAR
==========================================================*/

const sections=document.querySelectorAll("section");

const navLinks=document.querySelectorAll(".nav-links a");

window.addEventListener("scroll",()=>{

    let current="";

    sections.forEach(section=>{

        const top=section.offsetTop-120;

        const height=section.offsetHeight;

        if(pageYOffset>=top){

            current=section.getAttribute("id");

        }

    });

    navLinks.forEach(link=>{

        link.classList.remove("active");

        if(link.getAttribute("href")=="#"+current){

            link.classList.add("active");

        }

    });

});

/*==========================================================
BUTTON RIPPLE EFFECT
==========================================================*/

document.querySelectorAll(".btn").forEach(button=>{

button.addEventListener("click",function(e){

const circle=document.createElement("span");

const diameter=Math.max(this.clientWidth,this.clientHeight);

const radius=diameter/2;

circle.style.width=circle.style.height=diameter+"px";

circle.style.left=e.clientX-this.offsetLeft-radius+"px";

circle.style.top=e.clientY-this.offsetTop-radius+"px";

circle.className="ripple";

const ripple=this.querySelector(".ripple");

if(ripple){

ripple.remove();

}

this.appendChild(circle);

});

});

/*==========================================================
HERO PARALLAX
==========================================================*/

const heroImage=document.querySelector(".hero-image");

window.addEventListener("mousemove",(e)=>{

if(heroImage){

const x=(window.innerWidth/2-e.pageX)/40;

const y=(window.innerHeight/2-e.pageY)/40;

heroImage.style.transform=`translate(${x}px,${y}px)`;

}

});

/*==========================================================
SERVICE CARD HOVER
==========================================================*/

document.querySelectorAll(".service-card").forEach(card=>{

card.addEventListener("mousemove",(e)=>{

const rect=card.getBoundingClientRect();

const x=e.clientX-rect.left;

const y=e.clientY-rect.top;

card.style.setProperty("--x",x+"px");

card.style.setProperty("--y",y+"px");

});

});

/*==========================================================
PROJECT CARD TILT
==========================================================*/

document.querySelectorAll(".project-card").forEach(card=>{

card.addEventListener("mousemove",(e)=>{

const rect=card.getBoundingClientRect();

const x=e.clientX-rect.left;

const y=e.clientY-rect.top;

const rotateX=((y-rect.height/2)/18);

const rotateY=((rect.width/2-x)/18);

card.style.transform=

`perspective(1000px)
 rotateX(${rotateX}deg)
 rotateY(${rotateY}deg)
 scale(1.05)`;

});

card.addEventListener("mouseleave",()=>{

card.style.transform="perspective(1000px) rotateX(0) rotateY(0) scale(1)";

});

});

/*==========================================================
NUMBER FLOAT EFFECT
==========================================================*/

document.querySelectorAll(".stat-card").forEach(card=>{

card.addEventListener("mouseenter",()=>{

card.animate([

{

transform:"translateY(0px)"

},

{

transform:"translateY(-12px)"

},

{

transform:"translateY(0px)"

}

],{

duration:600

});

});

});

/*==========================================================
AUTO YEAR
==========================================================*/

const year=document.querySelector(".year");

if(year){

year.innerHTML=new Date().getFullYear();

}