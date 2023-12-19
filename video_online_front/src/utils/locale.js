export const getLocaleMessages = (locale) => {
  switch (locale) {
  case 'ru':
    return import('./../lang/ru.json')
  case 'az':
    return import('./../lang/az.json')
  case 'uz':
    return import('./../lang/uz.json')

  default:
    return import('./../lang/ru.json')
  }
}