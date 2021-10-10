import React from 'react';
import Router from 'next/router';
import _ from 'lodash';

import { getPage, getPages, getPageUrl, classNames, Link, withPrefix, pathJoin } from '../utils';

export default class htmlMenu extends React.Component {
    constructor(props) {
        super(props);
        this.handleWindowResize = this.handleWindowResize.bind(this);
        this.handleRouteChange = this.handleRouteChange.bind(this);
        this.htmlMenuOpenRef = React.createRef();
    }

    componentDidMount() {
        window.addEventListener('resize', this.handleWindowResize, true);
        Router.events.on('routeChangeStart', this.handleRouteChange);
    }

    componentWillUnmount() {
        window.removeEventListener('resize', this.handleWindowResize, true);
        Router.events.off('routeChangeStart', this.handleRouteChange);
    }

    handleWindowResize() {
        const menuOpenElm = _.get(this.htmlMenuOpenRef, 'current.offsetParent');
        if (menuOpenElm === null) {
            document.body.classList.remove('html-menu--opened');
        }
    }

    handleRouteChange() {
        document.body.classList.remove('html-menu--opened');
    }

    handlehtmlMenuToggle(event) {
        event.preventDefault();
        document.body.classList.toggle('html-menu--opened');
    }

    handlehtmlSubMenuToggle(event) {
        event.preventDefault();
        event.currentTarget.parentNode.classList.toggle('active');
    }

    renderhtmlRootLink(htmlRootPath, html, pageUrl) {
        const htmlRootPage = getPage(html, htmlRootPath);
        const htmlRootPageUrl = getPageUrl(htmlRootPage);
        const htmlRootPageTitle = _.get(htmlRootPage, 'title');

        return (
            <li
                className={classNames('html-menu-item', {
                    current: pageUrl === htmlRootPageUrl
                })}
            >
                <Link href={withPrefix(htmlRootPageUrl)}>{htmlRootPageTitle}</Link>
            </li>
        );
    }

    renderhtmlSectionLink(htmlSection, index, htmlRootPath, html, pageUrl) {
        const htmlSectionPath = pathJoin(htmlRootPath, htmlSection);
        const htmlSectionPage = getPage(html, htmlSectionPath);
        const htmlSectionPageUrl = getPageUrl(htmlSectionPage);
        const htmlSectionPageTitle = _.get(htmlSectionPage, 'title');
        const htmlSectionChildPages = _.orderBy(getPages(html, htmlSectionPath), 'weight');

        return (
            <li
                key={index}
                className={classNames('html-menu-item', {
                    'has-children': !_.isEmpty(htmlSectionChildPages),
                    current: pageUrl === htmlSectionPageUrl,
                    active: pageUrl.startsWith(htmlSectionPageUrl)
                })}
            >
                <Link href={withPrefix(htmlSectionPageUrl)}>{htmlSectionPageTitle}</Link>
                {!_.isEmpty(htmlSectionChildPages) && (
                    <React.Fragment>
                        <button className="html-submenu-toggle" onClick={this.handlehtmlSubMenuToggle.bind(this)}>
                            <span className="screen-reader-text">Submenu</span>
                            <span className="icon-angle-right" aria-hidden="true" />
                        </button>
                        <ul className="html-submenu">
                            {_.map(htmlSectionChildPages, (htmlChildPage, index) => this.renderhtmlChildLink(htmlChildPage, index, pageUrl))}
                        </ul>
                    </React.Fragment>
                )}
            </li>
        );
    }

    renderhtmlChildLink(htmlChildPage, index, pageUrl) {
        const htmlChildPageUrl = getPageUrl(htmlChildPage);
        const htmlChildPageTitle = _.get(htmlChildPage, 'title');

        return (
            <li
                key={index}
                className={classNames('html-menu-item', {
                    current: pageUrl === htmlChildPageUrl
                })}
            >
                <Link href={withPrefix(htmlChildPageUrl)}>{htmlChildPageTitle}</Link>
            </li>
        );
    }

    render() {
        const page = _.get(this.props, 'page');
        const pageUrl = getPageUrl(page);
        const html = _.get(this.props, 'html');
        const htmlConfig = _.get(this.props, 'htmlConfig');
        const htmlections = _.get(htmlConfig, 'sections');
        const htmlRootPath = _.get(htmlConfig, 'root_html_path');

        return (
            <nav id="html-nav" className="html-nav">
                <div id="html-nav-inside" className="html-nav-inside sticky">
                    <button id="html-nav-toggle" className="html-nav-toggle" ref={this.htmlMenuOpenRef} onClick={this.handlehtmlMenuToggle.bind(this)}>
                        Navigate html <span className="icon-angle-right" aria-hidden="true" />
                    </button>
                    <div className="html-nav-menu">
                        <ul id="html-menu" className="html-menu">
                            {this.renderhtmlRootLink(htmlRootPath, html, pageUrl)}
                            {_.map(htmlections, (htmlSection, index) => this.renderhtmlSectionLink(htmlSection, index, htmlRootPath, html, pageUrl))}
                        </ul>
                    </div>
                </div>
            </nav>
        );
    }
}
