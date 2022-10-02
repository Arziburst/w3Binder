// Templates
const templateCategories = require('../Categories/index.handlebars');

// Components
import { categories } from './index';

// Pages
import { buttonBackToMainPageEventClick } from '../../pages';

export const buttonBackToCategoriesEventClick = () => {
    const buttonBack = document.querySelector('#buttonBack');
    const inputSearch: Element | any = document.querySelector('#inputSearch');

    const contentAfterSearch = document.querySelector('#contentAfterSearch');


    if (!(buttonBack && inputSearch && contentAfterSearch)) {
        return;
    }

    contentAfterSearch.innerHTML = `${templateCategories()}`;
    buttonBack.removeEventListener('click', buttonBackToCategoriesEventClick);
    buttonBack.addEventListener('click', buttonBackToMainPageEventClick);
    categories();
    inputSearch.value = '';
};
