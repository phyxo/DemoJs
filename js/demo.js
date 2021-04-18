const demoJsReady = (callback) => {
    if (document.readyState != 'loading') {
	callback()
    } else {
	document.addEventListener('DOMContentLoaded', callback)
    }
}

demoJsReady(() => {
    console.log('Demo Js loaded');
});
