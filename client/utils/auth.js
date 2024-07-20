export default {

  loggedIn: false,

  async check () {
    let response;
    try {
      response = await fetch('/auth/check');
      if (response.ok) console.log('checking...we are authenticated!');
      this.loggedIn = response.ok ? true : false;
      return this.loggedIn;
    }
    catch (err) {
      console.error(err.stack);
      if (response.status === 401) {
        this.logout();
      }
    }
  },

  async signin (request) {
    const formData = await request.formData();
    const response = await fetch('/auth/login', {
      method: 'post',
      headers: {
        'Content-Type': 'x-www-form-urlencoded',
      },
      body: new URLSearchParams(formData).toString(),
    });

  async logout () {
    this.loggedIn = false;
    return;
  },

};
