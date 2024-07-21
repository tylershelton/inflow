export default {

  loggedIn: false,

  async check () {
    try {
      const response = await fetch('/auth/check', {
        credentials: 'include',
      });
      if (response.status === 200) {
        this.loggedIn = true;
      }
      else if (response.status === 401) {
        this.logout();
        this.loggedOut = false;
      }
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
