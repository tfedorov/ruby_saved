Site.create([
  {
    name: 'Makebet',
    host: 'http://makebet.herokuapp.com'
  }, {
    name: 'RailsCasts',
    host: 'http://railscasts.com'
  }
])
Banner.create([

  {
    name: 'fitness',
    uri: 'http://localhost:3000/images/fitness.jpg',
    link: 'http://www.fitstylelife.com/2015/03/the-40-hottest-fitness-chicks-of-instagram/'
  },
  {
    name: 'green_peace',
    uri: 'http://localhost:3000/images/green.jpg',
    link: 'http://www.greenpeace.org/international/en/'
  },
  {
    name: 'uefa',
    uri: 'http://localhost:3000/images/uefa.jpg',
    link: 'http://www.uefa.com/'
  },
  {
    name: 'tourism',
    uri: 'http://localhost:3000/images/tourism.jpg',
    link: 'http://www.eliteislandresorts.com'
  }
])
BannerSite.create([
  {
    banner_id: 1,
    site_id: 1,
    max_show: 100,
    show_number: 0,
    click_number: 0,
    show_time: 4000
  },
  {
    banner_id: 2,
    site_id: 1,
    max_show: 100,
    show_number: 0,
    click_number: 0,
    show_time: 6000
  },
  {
    banner_id: 3,
    site_id: 1,
    max_show: 100,
    show_number: 0,
    click_number: 0,
    show_time: 4000
  },
  {
    banner_id: 1,
    site_id: 2,
    max_show: 50,
    show_number: 0,
    click_number: 0,
    show_time: 4000
  },
  {
    banner_id: 3,
    site_id: 2,
    max_show: 100,
    show_number: 0,
    click_number: 0,
    show_time: 5000
  },
  {
    banner_id: 4,
    site_id: 2,
    max_show: 100,
    show_number: 0,
    click_number: 0,
    show_time: 4000
  }
])
