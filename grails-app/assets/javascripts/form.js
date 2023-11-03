const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});

(function() {
    // Replace '${usernameParameter ?: 'username'}' with the actual condition
    const usernameParameter = 'username'; // You should have a value for usernameParameter
    document.forms['loginForm'].elements[usernameParameter].focus();
})();
