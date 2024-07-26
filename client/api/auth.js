export default {

  loggedIn: false,

  async check () {
    try {
      const response = await fetch('/api/auth/check', {
        credentials: 'include',
      });
      if (response.status === 200) {
        this.loggedIn = true;
      }
      else if (response.status === 401) {
        this.loggedIn = false;
      }
    }
    catch (err) {
      console.error(err.stack);
    }
  },

  async login (formData) {
    const response = await fetch('/api/auth/login', {
      method: 'post',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: new URLSearchParams(formData).toString(),
    });

    if (response.ok) {
      this.loggedIn = true;
      return;
    }
    
    throw response;
  },

  async logout () {
    await fetch('/api/auth/logout', {
      method: 'post',
    });
    this.loggedIn = false;
    return;
  },

};
