export default {
  async check () {
    const response = await fetch('/auth/check');
    if (response.ok) console.log('we are authenticated!');
    return response.ok ? true : false;
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

    return response;
  },
};
