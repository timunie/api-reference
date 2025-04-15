// This file is copied and edited from here: https://github.com/EWSoftware/SHFB 
// 
//===============================================================================================================
// System  : Sandcastle Tools Standard Presentation Styles
// Author  : Eric Woodruff  (Eric@EWoodruff.us)
// Note    : Copyright 2015-2022, Eric Woodruff, All rights reserved
//
// This file contains the presentation style definition for the markdown content presentation style
//
// This code is published under the Microsoft Public License (Ms-PL).  A copy of the license should be
// distributed with the code and can be found at the project website: https://GitHub.com/EWSoftware/SHFB.  This
// notice, the author's name, and all copyright notices must remain intact in all applications, documentation,
// and source files.
//
//    Date     Who  Comments
// ==============================================================================================================
// 04/02/2015  EFW  Created the code
// 02/27/2025  TU   Adjusted the code to support the MDX-format
//===============================================================================================================


using System;
using System.Linq;
using System.Xml.Linq;
using Sandcastle.Core.PresentationStyle.Transformation;
using Sandcastle.Core.PresentationStyle.Transformation.Elements;

namespace DocusaurusPresentationStyle.DocusaurusMarkdown.Elements;

public class MdxRemarksElement(string name) : NamedSectionElement(name)
{
    /// <inheritdoc />
    public override void Render(TopicTransformationCore transformation, XElement element)
    {
        if (transformation.CurrentElement.Name == "document")
        {
            base.Render(transformation, element);
            return;
        }
        
        
        if (transformation == null)
            throw new ArgumentNullException(nameof (transformation));
        if (element == null)
            throw new ArgumentNullException(nameof (element));
        if (!element.Elements().Any() && element.Value.NormalizeWhiteSpace().Length == 0)
            return;

        transformation.CurrentElement.Add(new XElement("span", " **Remarks:** "));
        transformation.RenderChildElements(transformation.CurrentElement, element.Nodes());
    }
}
