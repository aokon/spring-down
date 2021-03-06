import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  active: DS.attr('boolean'),
  picture: DS.attr('string'),

  products: DS.hasMany('product', { async: true })
});
