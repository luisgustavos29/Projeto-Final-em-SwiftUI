//
//  Home.swift
//  projeto_final01
//
//  Created by Turma01-8 on 26/02/25.
//
 import SwiftUI

struct Home: View {
    @State private var moodValue: CGFloat = 0.5 // Initial mood value (0.0 to 1.0)

    var body: some View {
        NavigationStack {
            ZStack {
                Color.cinza
                VStack {
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Olá,")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 30, weight: .bold))
                                Text("Fulano 👋")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 24))
                            }
                            
                            Image(systemName: "bell")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .padding(.trailing)
                        }
                        .padding(.horizontal)

                        HStack {
                            Button(action: {}) {
                                VStack {
                                    Image(systemName: "leaf")
                                        .font(.system(size: 30))
                                        .padding(.bottom, 4)
                                    Text("Planos e\ncuidados")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 14))
                                }
                                .frame(width: 80, height: 80)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.laranja)
                                .cornerRadius(10)
                            }

                            Button(action: {}) {
                                VStack {
                                    Image(systemName: "calendar")
                                        .font(.system(size: 30))
                                        .padding(.bottom, 4)
                                    Text("Minhas\nsessões")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 14))
                                }
                                .frame(width: 80, height: 80)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.laranja)
                                .cornerRadius(10)
                            }

                            Button(action: {}) {
                                VStack {
                                    Image(systemName: "list.bullet.rectangle") // Content list icon
                                        .font(.system(size: 30))
                                        .padding(.bottom, 4)
                                    Text("Conteúdos")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 14))
                                }
                                .frame(width: 80, height: 80)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.laranja)
                                .cornerRadius(10)
                            }
                        } // Fechamento do HStack
                    } // Fechamento do VStack
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .background(.laranja)
                    .cornerRadius(30.0)
                    .ignoresSafeArea()

                    HStack {
                        VStack {
                            Text("Agende sua")
                                .foregroundStyle(.laranja)
                                .font(.system(size: 20))

                            Text("próxima sessão")
                                .foregroundStyle(.laranja)
                                .font(.system(size: 20))

                        } // Fechamento do VStack
                        .frame(alignment: .leading)

                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                    } // Fechamento do HStack
                    .frame(width: 360, height: 150)
                    .background(.white)
                    .cornerRadius(15.0)

                    // MARK: - ScrollView "Feito para sua rotina"
                    VStack(alignment: .leading) {
                        Text("Feito para sua rotina")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                TestCard(title: "Ansiedade", imageName: "ansiedade")
                                TestCard(title: "Depressão", imageName: "depressao")
                                TestCard(title: "Ver todos", imageName: "vertodos") // Added "Ver todos"
                            }
                            .padding(.horizontal)
                            .frame(height: 150) // Fixed height for the scroll view
                        }
                    }
                  //  .padding(.bottom)

                    // MARK: - Meu Diário Emocional
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Meu Diário Emocional")
                                .foregroundStyle(.laranja)
                                .font(.system(size: 20))
                            Spacer()
                            Text("Ver tudo >")
                                .foregroundStyle(.gray)
                                .font(.system(size: 16))
                        }
                        .padding(.horizontal)

                        Text("Registre agora")
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                            .padding(.horizontal)
                            .padding(.bottom, 5)

                        MoodSlider(moodValue: $moodValue)
                           // .frame(width: 360, height: 50)
                    }
                    .frame(width: .infinity, height: .infinity)
                    .padding()
                    .background(.white)
                    .cornerRadius(15.0)
                    .padding()
           

                    Spacer()

                } // Fechamento do VStack

            }// Fechamento do ZStack

        }// Fechamento do NavigationStack
    }
}

struct TestCard: View {
    let title: String
    let imageName: String

    var body: some View {
        VStack {
            Image(imageName) // Use Image to load image from assets
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding(.bottom, 4)
            Text("Teste\n\(title)")
                .multilineTextAlignment(.center)
                .font(.system(size: 14))
        }
        .frame(width: 140, height: 120) // Adjusted width
        .padding()
        .background(Color.white.opacity(0.9)) // Adding a slightly transparent background
        .foregroundColor(.laranja)
        .cornerRadius(10)
    }
}

struct MoodSlider: View {
    @Binding var moodValue: CGFloat
    @State private var isRecording: Bool = false

    var body: some View {
        VStack(spacing: 40){
            GeometryReader { geometry in
                HStack {
                    Image(systemName: "face.smiling.fill")
                        .foregroundColor(.gray)
                    Slider(value: $moodValue)
                    Image(systemName: "face.smiling.fill")
                        .foregroundColor(.orange)
                }
                .padding(.horizontal)
            }
           
            Button(action: {
                isRecording = true
                //TODO: Salvar o humor do usuário
                print("Mood value: \(moodValue)")
            }) {
                Text("Gravar Humor")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(isRecording)
        }
    }
}


#Preview {
    Home()
}

