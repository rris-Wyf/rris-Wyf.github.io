
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Wang Yifan"
#let locale-catalog-page-numbering-style = context { "Wang Yifan - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Sep 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.2em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 0, 0)
#let design-section-titles-font-family = "XCharter"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.2em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.55cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "XCharter"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "XCharter"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "XCharter"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "|"
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.19cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.3em
#let design-entries-vertical-space-between-entries = 0.4cm
#let design-entries-date-and-location-width = 6cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = false
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Wang Yifan

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Singapore],
  [#box(original-link("mailto:ywang114@e.ntu.edu.sg")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)ywang114\@e.ntu.edu.sg])],
  [#box(original-link("https://rris-wyf.github.io/")[#fa-icon("link", size: 0.9em) #h(0.05cm)rris-wyf.github.io])],
  [#box(original-link("https://linkedin.com/in/yifan-wang-447442191")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)yifan-wang-447442191])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Final-year Ph.D. candidate at NTU specializing in assistive robotics. My research focuses on developing intelligent robotic systems and personalized strategies to support individuals with gait and balance impairments. Central to my work is the creation of a Real2Sim2Real framework that integrates digital twins of both humans and robots. This framework enables accurate modeling of user-robot interactions and co-adaptation, facilitating rapid design iterations through simulation and enabling personalization of assistive strategies based on realistic human behavior.]
)


== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://www.ntu.edu.sg/")[#strong[Nanyang Technological University \(NTU\)]], Singapore

#strong[#strong[Ph.D.] in #strong[Mechanical Engineering]]
  ],
  right-content: [
    Jan 2021 -- Apr 2026 \(Expected\)
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[Advisor:] Prof. Ang Wei Tech],[#strong[Awards:] NTU Research Scholarship \(2021-2025\)],[#strong[Research Interests:] Physics-Based Simulation, Human-Robot Interaction, Assistive and Rehabilitation Robotics],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://nus.edu.sg/")[#strong[National University of Singapore \(NUS\)]], Singapore

#strong[#strong[M.S.] in #strong[Mechanical Engineering]]
  ],
  right-content: [
    Aug 2019 – Dec 2020
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[GPA:] 4.39\/5.00],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://en.sjtu.edu.cn/")[#strong[Shanghai Jiao Tong University \(SJTU\)]], Shanghai, China

#strong[#strong[B.S.] in #strong[Mechanical Engineering]]
  ],
  right-content: [
    Sep 2014 – Jun 2018
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[GPA:] 3.48\/4.00],[#strong[Awards:] SJTU Excellent Undergraduate Scholarship \(2015 - 2017\), SJTU Excellent Project Award \(2016, 2017\)],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Research Projects


#two-col-entry(
  left-content: [
    #strong[Human-In-The-Loop Robotic Simulator] -- #strong[NTU]
  ],
  right-content: [
    Nov 2023 – present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed a human-in-the-loop \(HITL\) simulation platform for assistive robots, integrating a human digital twin, robot digital twin, and a physical human–robot interaction \(pHRI\) model.],[Built a human digital twin pipeline combining skeletal, musculoskeletal, and soft-body models with reinforcement learning to simulate diverse capabilities and enable adaptive, realistic robot testing.],[Designed a robot digital twin pipeline for multiple assistive robots \(e.g., gait-assistive robots, lower-limb exoskeletons, robotic arm extenders\), incorporating accurate kinematic, dynamic, and control models to ensure realistic simulation of robot behavior and interactions.],[Investigated human–robot interaction modalities in simulation, including soft-body dynamics, mass-spring-damper representations, and other physics-based models to capture complex pHRI.],[Created a Sim2Real framework to personalize controllers and optimize ergonomic design and safety for gait-assistive robots and exoskeletons, enabling simulation-informed adaptation and more efficient real-world testing.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Mobile Robotic Balance Assistant \(MRBA\)] -- #strong[NTU]
  ],
  right-content: [
    Jan 2021 – Dec 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Designed and developed a mobile robotic balance assistant to aid individuals with balance impairments in daily activities, focusing on electronics integration and control systems.],[Created a user-following algorithm enabling smooth, adaptive trajectory planning and dynamic path adjustment in response to user gait variations, speed changes and environmental obstacles.],[Developed quantitative balance indicators and an intelligent fall-detection\/intervention algorithm using multi-sensor inputs to provide timely assistance during balance-loss events.],[Led large-scale clinical trials with 50+ participants, including elderly and stroke survivors, to evaluate MRBA’s effectiveness in clinical settings.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Head Pose Estimation for Assisting Radiotherapy of Nose Cancers] -- #strong[NUS]
  ],
  right-content: [
    Aug 2019 – Dec 2020
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed algorithms to track head motion and estimate head orientation in real-time, enabling precise localization of tumors during radiotherapy with CT-scanned head models.],[Implemented a facial feature extraction pipeline using OpenCV and geometric methods to align 3D head points with 2D image projections, achieving effective motion tracking.],[Designed and trained a CNN based on ResNet50 using datasets \(300W-LP, AFLW 2000\), improving head pose prediction accuracy for clinical applications.],)
  ],
)



== Work Experience


#two-col-entry(
  left-content: [
    #strong[Teaching Assistant], Nanyang Technological University -- Singapore
  ],
  right-content: [
    Aug 2022 – Dec 2024
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Delivered tutorials and labs for E2.9 Balancing of Rotating Masses and MA3004 Mathematics Methods in Engineering and assisted in course material design.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Research Assistant], Nanyang Technological University -- Singapore
  ],
  right-content: [
    Aug 2022 – present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Mentored and scoped three undergraduate and two master's projects, defining research objectives, guiding technical execution and skill development.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Data Analyst Intern], Shopee -- Singapore
  ],
  right-content: [
    Oct 2020 – Dec 2020
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Analyzed e-commerce transaction data to identify key consumer trends and behaviors.],[Identified anomalies in online transactions, contributing to fraud detection, improved system efficiency, and enhanced user experience.],[Worked with cross-functional teams to optimize operation processes in digital commerce platforms.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Data Analyst Intern], Huatai Securities -- Shenzhen, China
  ],
  right-content: [
    July 2020 – Sep 2020
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Processed and analyzed extensive financial text datasets \(news, reports, research notes\) to extract market trends and actionable insights],[Developed sentiment analysis models using natural language processing \(NLP\) algorithms \(e.g. BERT\) to quantify investor sentiment from financial texts.],[Built interactive data visualization dashboards to communicate analytical findings effectively to decision-makers.],)
  ],
)



== Selected Publications


#two-col-entry(
  left-content: [
    #strong[Towards Human-centered Gait Assistance - A Real2Sim2Real Framework for Gait Assistive Robots]

  ],
  right-content: [
    Under Review
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[Yifan Wang]], Chengyuan Yang, Chun Kwang Tan, Sherwin Stephen Chan, Youlong Wang, Lei Li, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE Transactions on Robotics \(T-RO\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[PHREASE - Personalized Human-Robot Interaction Simulation with Accurate Soft Body Modeling for Safe and Ergonomic Gait Assistance]

  ],
  right-content: [
    Oct 2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[Yifan Wang]], Chengyuan Yang, Vasanthamaran Ravichandram, Sherwin Stephen Chan, Chun Kwang Tan, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE\/RSJ International Conference on Intelligent Robots and Systems \(IROS\) Workshop])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A Human-In-The-Loop Simulation Framework for Evaluating Control Strategies in Gait Assistive Robots]

  ],
  right-content: [
    May 2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[Yifan Wang]], Sherwin Stephen Chan, Mingyuan Lei, Lek Syn Lim, Henry Johan, Bingran Zuo, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Robotics and Automation \(ICRA\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Graceful User Following for Mobile Balance Assistive Robot in Daily Activities]

  ],
  right-content: [
    July 2023
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[Yifan Wang]], Meng Yuan, Lei Li, Karen Sui Geok Chua, Seng Kwee Wee, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)The 22nd World Congress of the International Federation of Automatic Control \(IFAC WC\)])



== Skills


#one-col-entry(
  content: [#strong[Programming Languages:] Python, C++, C, MATLAB & Simulink]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Robotics:] MuJoCo & MJX, OpenSim, Machine Learning \(PyTorch, TensorFlow, Equinox\), SolidWorks, STM32]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Spoken Languages:] Mandarin \(Native\), English \(Professional fluency\)]
)


