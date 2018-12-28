# -*- coding: utf-8 -*-
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

import os.path
import re


def resource(name):
    return os.path.join(
        os.path.dirname(__file__),
        'resources',
        name,
    )


class Image(object):
    @keyword('Crop image')
    def crop_image(self, output_dir, filename, left, top, width, height):
        """Crop the saved image at the given ``output_dir`` with the given
        ``filename`` down to the given dimensions.

        This keyword is primarily for the internal use of this keyword library.
        """
        from PIL import Image

        img = Image.open(os.path.join(output_dir, filename))
        box = (int(left), int(top), int(left + width), int(top + height))

        area = img.crop(box)

        with open(os.path.join(output_dir, filename), 'wb') as output:
            area.save(output, 'png')


class SeleniumScreenshots(Image):
    """SeleniumScreenshots library for Robot Framework provides keywords for
    annotating and cropping screenshots taken with SeleniumLibrary.

    The library requires SeleniumLibrary 3.2 or later.
    """
    crop_margin = 10

    def __init__(self, crop_margin=10):
        """Accepts the following optional keyword arguments:

        ``crop_margin``
            desired margin added around the selected areas in cropped
            screenshots.
        """
        self.crop_margin = crop_margin

    @property
    def selenium_library(self):
        return BuiltIn().get_library_instance('SeleniumLibrary')

    @keyword('Bootstrap jQuery')
    def bootstrap_jquery(self):
        """Injects jQuery into the currently active window when it does not
        exist already.

        Most of the SeleniumScreenshots library keywords rely on jQuery
        being available on the current page. If jQuery is not globally
        available on the current page, it can be injected using this
        keyword. Otherwise the keywords will fail.

        This keyword is primarily for the internal use of this keyword library.
        """
        return self.selenium_library.execute_async_javascript(
            resource('bootstrap_jquery.js'),
        )

    @keyword('Normalize annotation locator')
    def normalize_annotation_locator(self, locator):
        """Normalizes the given *SeleniumLibrary*-locator into
        *Sizzle*-selector, which is the supported selector format in the jQuery
        based keywords of this library.

        Returns a normalized version of the given locator.

        This keyword is primarily for the internal use of this keyword library.
        """
        if re.match(r'^jquery[=:]', locator):
            locator = locator[len('jquery='):]
        elif re.match(r'^css[=:]', locator):
            locator = locator[len('css='):]
        elif re.match(r'^name[=:]', locator):
            locator = '[@name="' + locator[len('name='):] + '"]'
        elif re.match(r'^link[=:]', locator):
            locator = 'a:icontains("' + locator[len('name='):] + '"):eq(0)'
        elif re.match(r'^id[=:]', locator):
            locator = '#' + locator[len('id='):]
        else:
            locator = '#' + locator

        return locator

    @keyword('Add pointer')
    def add_pointer(self, locator, size=20, top=50, left=50):
        """Adds a round transparent dot at the center of the given ``locator``.

        Accepts the following optional keyword arguments:

        ``size``
            size of the pointer in pixels

        ``top``
            top alignment of the pointer in percents

        ``left``
            left alignment of the pointer in percents.

        Returns id of the created element.
        """
        assert self.bootstrap_jquery()
        selector = self.normalize_annotation_locator(locator)
        id_ = self.selenium_library.execute_async_javascript(
            resource('add_pointer.js'),
            'ARGUMENTS',
            selector,
            size,
            top,
            left,
        )
        if not id_:
            raise AssertionError(
                selector + ' not found and no pointer was created',
            )
        return id_

    @keyword('Add dot')
    def add_dot(
            self,
            locator,
            text='',
            color='black',
            background='#fcf0ad',
            size=20,
            top=50,
            left=50
    ):
        """Adds a colored round dot at the center of the given ``locator``
        with optional text.

        Accepts the following optional keyword arguments:

        ``text``
            text rendered inside the dot

        ``color``
            foreground color of the dot

        ``background``
            background color of the dot

        ``size``
            size of the dot in pixels

        ``top``
            top alignment of the dot in percents

        ``left``
            left alignment of the dot in percents.

        Returns id of the created element.
        """
        assert self.bootstrap_jquery()
        selector = self.normalize_annotation_locator(locator)
        id_ = self.selenium_library.execute_async_javascript(
            resource('add_dot.js'),
            'ARGUMENTS',
            selector,
            text,
            color,
            background,
            size,
            top,
            left,
        )
        if not id_:
            raise AssertionError(
                selector + ' not found and no dot was created',
            )
        return id_

    @keyword('Add note')
    def add_note(
            self,
            locator,
            text,
            width=None,
            color='black',
            background='#fcf0ad',
            border='none',
            position='center',
            display='block'
    ):
        """Adds a colored note at the given ``locator`` with the given
        ``text``.

        Accepts the following optional keyword arguments:

        ``width``
            width of the note in pixels

        ``color``
            foreground color of note note

        ``background``
            background color of the note

        ``border``
            border style of the note

        ``position``
            position of the note relative to the given ``locator`` and must be
            one of the following values: ``center``, ``top``, ``right``,
            ``bottom`` or ``left``

        ``display``
            display style property value of the note.

        Returns id of the created element.
        """
        assert self.bootstrap_jquery()
        selector = self.normalize_annotation_locator(locator)
        id_ = self.selenium_library.execute_async_javascript(
            resource('add_note.js'),
            'ARGUMENTS',
            selector,
            text,
            width,
            color,
            background,
            border,
            position,
            False,
            self.crop_margin,
            display,
        )
        if not id_:
            raise AssertionError(
                selector + ' not found and no note was created',
            )
        return id_

    @keyword('Add pointy note')
    def add_pointy_note(
            self,
            locator,
            text,
            width=None,
            color='black',
            background='#fcf0ad',
            border='none',
            position='center',
            display='block'
    ):
        """Adds a colored pointy note at the given ``locator`` with the given
        ``text``.

        Accepts the following optional keyword arguments:

        ``width``
            width of the note in pixels (leave empty for auto)

        ``color``
            foreground color of note note

        ``background``
            background color of the note

        ``border``
            border style of the note

        ``position``
            position of the note relative to the given ``locator`` and must be
            one of the following values: ``center``, ``top``, ``right``,
            ``bottom`` or ``left``

        ``display``
            display style property value of the note.

        Returns id of the created element.
        """
        assert self.bootstrap_jquery()
        selector = self.normalize_annotation_locator(locator)
        id_ = self.selenium_library.execute_async_javascript(
            resource('add_note.js'),
            'ARGUMENTS',
            selector,
            text,
            width,
            color,
            background,
            border,
            position,
            True,
            self.crop_margin,
            display,
        )
        if not id_:
            raise AssertionError(
                selector + ' not found and no note was created',
            )
        return id_

    @keyword('Remove element')
    def remove_element(self, locator):
        """Removes the element at the given ``locator`` from the current
        page.
        """
        assert self.bootstrap_jquery()
        selector = self.normalize_annotation_locator(locator)
        return self.selenium_library.execute_async_javascript(
            resource('remove_element.js'),
            'ARGUMENTS',
            selector,
        )

    @keyword('Remove elements')
    def remove_elements(self, *locators):
        """Removes the elements at the given ``locators`` from the current
        page.
        """
        assert self.bootstrap_jquery()
        results = []
        for locator in locators:
            selector = self.normalize_annotation_locator(locator)
            results.append(
                self.selenium_library.execute_async_javascript(
                    resource('remove_element.js'),
                    'ARGUMENTS',
                    selector,
                )
            )
        return False not in results

    @keyword('Update element style')
    def update_element_style(self, locator, name, value):
        """Updates style for elements at the ``locator`` matching the given
        ``name`` with the given ``value``,
        """
        assert self.bootstrap_jquery()
        selector = self.normalize_annotation_locator(locator)
        return self.selenium_library.execute_async_javascript(
            resource('update_element_style.js'),
            'ARGUMENTS',
            selector,
            name,
            value,
        )

    @keyword('Align elements horizontally')
    def align_elements_horizontally(self, *locators):
        """Aligns the elements matching the given ``locators`` so that the
        subsequent elements are aligned after the first element.
        """
        assert self.bootstrap_jquery()
        selectors = map(self.normalize_annotation_locator, locators)
        return self.selenium_library.execute_async_javascript(
            resource('align_elements_horizontally.js'),
            'ARGUMENTS',
            list(selectors),
            self.crop_margin,
        )

    @keyword('Crop page screenshot')
    def crop_page_screenshot(self, filename, *locators):
        """Crops the given ``filename`` to match the combined bounding box of
        the elements matching the given ``locators``.

        This keyword is primarily for the internal use of this keyword library.
        """
        assert self.bootstrap_jquery()
        selectors = map(self.normalize_annotation_locator, locators)
        dimensions = self.selenium_library.execute_async_javascript(
            resource('get_bounding_box.js'),
            'ARGUMENTS',
            list(selectors),
            self.crop_margin,
        )
        if len(dimensions) != 4:
            raise AssertionError(
                dimensions[0] + ' not found and no image was cropped',
            )
        output_dir = BuiltIn().get_variable_value('${OUTPUT_DIR}')
        return self.crop_image(output_dir, filename, *dimensions)

    @keyword('Capture and crop page screenshot')
    def capture_and_crop_page_screenshot(self, filename, *locators):
        """Captures a page screenshot with the given ``filename`` and crops it to
        match the combined bounding box of the elements matching the given
        ``locators``.
        """
        self.selenium_library.capture_page_screenshot(filename, )
        return self.crop_page_screenshot(filename, *locators)

    @keyword('Capture viewport screenshot')
    def capture_viewport_screenshot(self, filename):
        """Captures a page screenshot with the given ``filename`` and crops it
        to match the current browser window dimensions and scroll position.
        """
        assert self.bootstrap_jquery()
        dimensions = self.selenium_library.execute_async_javascript(
            resource('get_viewport_box.js'),
        )
        self.selenium_library.capture_page_screenshot(filename, )
        output_dir = BuiltIn().get_variable_value('${OUTPUT_DIR}')
        return self.crop_image(output_dir, filename, *dimensions)

    @keyword('Highlight')
    def highlight(self, locator, width=3, style='dotted', color='red'):
        """Adds a simple highlighting for the elements at the given
        ``locator``.
        """
        return self.update_element_style(
            locator,
            'outline',
            str(width) + 'px ' + style + ' ' + color,
        )

    @keyword('Clear highlight')
    def clear_highlight(self, locator):
        """Clears the highlighting from the elements at the given ``locator``.
        """
        return self.update_element_style(
            locator,
            'outline',
            'none',
        )
