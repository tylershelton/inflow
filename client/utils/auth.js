export default {

  loggedIn: false,

  async check () {
    let response;
    try {
      response = await fetch('/auth/check', {
        credentials: 'include',
      });
      if (response.status === 200) {
        console.log('checking...we are authenticated!');
      }
      else if (response.status === 401) {
        console.log('checking...not logged in.');
        this.logout();
      }
      this.loggedIn = response.ok ? true : false;
      return this.loggedIn;
    }
    catch (err) {
      console.error(err.stack);
    }
  },

  async login (request) {
    const formData = await request.formData();
    const response = await fetch('/auth/login', {
      method: 'post',
      headers: {
        'Content-Type': 'x-www-form-urlencoded',
      },
      body: new URLSearchParams(formData).toString(),
    });
    this.loggedIn = response.ok;
    return;
  },

  async logout () {
    this.loggedIn = false;
    return;
  },

};
