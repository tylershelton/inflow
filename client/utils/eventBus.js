const eventBus = {
  on (event, callback) {
    // register a new event on the bus. `callback` will be
    // fired when the event occurs.
    document.addEventListener(event, (e) => callback(e.detail));
  },

  dispatch (event, data) {
    // fire an event, along with some data
    document.dispatchEvent(new CustomEvent(event, { detail: data }));
  },

  remove (event, callback) {
    // remove attached event from `document` to prevent memory leakage
    document.removeEventListener(event, callback);
  },
};

export default eventBus;
