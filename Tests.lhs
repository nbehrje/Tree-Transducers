> {-|
> Test Sentences
> |-}

> import Trees
> import Transducer

== Subject only ==

> subjTT = TT {
>         states = ["qNP", "qWP"]
>       , sigma = ["the dog"]
>       , finals = ["NP"]
>       , delta = dSubj
> }

> dSubj [] "the dog" = [("qNoun", "the dog", []), ("qWhat", "what", [])]
> dSubj [] "is" = [("qBe", "is", [])]
> dSubj [] "big" = [("qAdjective", "big", [])]
> dSubj ["qNoun"] "NP" = [("qNP", "NP", [0])]
> dSubj ["qBe"] "AUX" = [("qAUX", "AUX", [0])]
> dSubj ["qAdjective"] "ADJ" = [("qADJ", "ADJ", [0])]
> dSubj ["qAUX", "qADJ"] "VP" = [("qVP", "VP", [0, 1])]
> dSubj ["qNP", "qVP"] "S" = [("qS", "S", [0, 1])]
> dSubj _ _ = []

The dog is big.
What is big?

> test1In = Node "S" [
>                    Node "NP" [
>                        Node "the dog" []
>                    ],
>                    Node "VP" [
>                        Node "AUX" [
>                            Node "is" []
>                        ],
>                        Node "ADJ" [
>                            Node "big" []
>                        ]
>                    ]
>   ]

> test1Out = Node "S" [
>                   Node "WP" [
>                       Node "what" []
>                   ],
>                   Node "VP" [
>                       Node "AUX" [
>                            Node "is" []
>                       ],
>                        Node "ADJ" [
>                            Node "big" []
>                        ]
>                   ]
>   ]

The dogs are big.
What are big?

> test2In = Node "S" [
>                    Node "NP" [
>                        Node "the dogs" []
>                    ],
>                    Node "VP" [
>                        Node "AUX" [
>                            Node "are" []
>                        ],
>                        Node "ADJ" [
>                            Node "big" []
>                        ]
>                    ]
>   ]

> test2Out = Node "S" [
>                   Node "WP" [
>                       Node "what" []
>                   ],
>                   Node "VP" [
>                       Node "AUX" [
>                            Node "are" []
>                       ],
>                        Node "ADJ" [
>                            Node "big" []
>                        ]
>                   ]
>   ]

I am big.
What is big?

> test3In = Node "S" [
>                    Node "NP" [
>                        Node "I" []
>                    ],
>                    Node "VP" [
>                        Node "AUX" [
>                            Node "am" []
>                        ],
>                        Node "ADJ" [
>                            Node "big" []
>                        ]
>                    ]
>   ]

> test3Out = Node "S" [
>                   Node "WP" [
>                       Node "what" []
>                   ],
>                   Node "VP" [
>                       Node "AUX" [
>                            Node "is" []
>                       ],
>                        Node "ADJ" [
>                            Node "big" []
>                        ]
>                   ]
>   ]

The dog runs.
What runs?

> test4In = Node "S" [
>                    Node "NP" [
>                        Node "the dog" []
>                    ],
>                    Node "VP" [
>                        Node "V" [
>                            Node "runs" []
>                        ]
>                    ]
>   ]

> test4Out = Node "S" [
>                   Node "WP" [
>                       Node "what" []
>                   ],
>                   Node "VP" [
>                        Node "V" [
>                            Node "runs" []
>                        ]
>                   ]
>   ]

The dogs are running.
What are running?

> test5In = Node "S" [
>                    Node "NP" [
>                        Node "the dog" []
>                    ],
>                    Node "VP" [
>                        Node "AUX" [
>                            Node "is" []
>                        ],
>                        Node "V" [
>                            Node "running" []
>                        ]
>                    ]
>   ]

> test5Out = Node "S" [
>                   Node "WP" [
>                       Node "what" []
>                   ],
>                   Node "VP" [
>                        Node "AUX" [
>                            Node "is" []
>                        ],
>                        Node "V" [
>                            Node "running" []
>                        ]
>                    ]
>   ]