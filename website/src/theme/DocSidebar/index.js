import React from 'react';
import DocSidebar from '@theme-original/DocSidebar';

// Resize script inspired from: https://medium.com/the-z/making-a-resizable-div-in-js-is-not-easy-as-you-think-bda19a1bc53d

export default function DocSidebarWrapper(props) {
    const minimum_size = 200;
    const maximum_size = 700;
    let original_width = 0;
    let original_mouse_x = 0;
    let original_mouse_y = 0;
    let sidebar;

    function resize(e) {
        let newWidth = original_width + (e.pageX - original_mouse_x);

        if (newWidth < minimum_size) {
            newWidth = minimum_size;
        }

        if (newWidth > maximum_size) {
            newWidth = maximum_size;
        }

        sidebar.style.width = newWidth + 'px';
    }

    function stopResize() {
        window.removeEventListener('mousemove', resize)
    }


    function ResizerOnMouseDown(e) {
        e.preventDefault();

        original_mouse_x = e.pageX;
        original_mouse_y = e.pageY;

        sidebar = document.querySelector("nav.menu");
        original_width = parseFloat(getComputedStyle(sidebar, null).getPropertyValue('width').replace('px', ''));;

        window.addEventListener('mousemove', resize)
        window.addEventListener('mouseup', stopResize)
    }

    return (
    <>
      <DocSidebar {...props} />
        <div className="resizer"
             onMouseDown={ResizerOnMouseDown} />
    </>
  );
}
